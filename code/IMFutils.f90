module IMFutils

implicit none
type TIMFPart
  real*8 alpha !power slope (should be negative)
  real*8 m_min, m_max
  real*8 f_min, f_max
  real*8 scalefactor
  real*8 fraction
end type TIMFPart

type (TIMFPart), save :: imfParts(5)
integer, save         :: imfPartCount
real*8                :: imfAverage

contains

real*8 function TIMFPart_getIntegral(t)
type (TIMFPart), intent(in) :: t
  TIMFPart_getIntegral = t%scalefactor*( (t%m_max**(t%alpha+1) - t%m_min**(t%alpha+1))/(t%alpha+1))
end function TIMFPart_getIntegral

real*8 function TIMFPart_getLower(t)
type (TIMFPart), intent(in) :: t
  TIMFPart_getLower = t%scalefactor*t%m_min**t%alpha
end function TIMFPart_getLower

real*8 function TIMFPart_getUpper(t)
type (TIMFPart), intent(in) :: t
  TIMFPart_getUpper = t%scalefactor*t%m_max**t%alpha
end function TIMFPart_getUpper


subroutine TIMFPart_Normalize
integer i
real*8 f, summ
type (TIMFPart) t
  summ = 0D0
  do i = 1, imfPartCount
    t = imfParts(i)
    if (i.eq.1) then
      imfParts(i)%scalefactor = 1D0
    else
      imfParts(i)%scalefactor = TIMFPart_getUpper(imfParts(i-1))/(t%m_min**t%alpha)
    end if
    summ = summ + TIMFPart_getIntegral(imfParts(i))
  enddo
  imfParts(:)%scalefactor = imfParts(:)%scalefactor/summ
  summ = 0D0
  do i = 1, imfPartCount
    imfParts(i)%fraction = TIMFPart_getIntegral(imfParts(i))
    summ = summ + imfParts(i)%fraction
  enddo
  imfParts(:)%fraction = imfParts(:)%fraction/summ
  imfParts(:)%f_min = imfParts(:)%m_min**(imfParts(:)%alpha+1)
  imfParts(:)%f_max = imfParts(:)%m_max**(imfParts(:)%alpha+1)
  summ = 0D0
  do i = 1, imfPartCount
    f = imfParts(i)%alpha+2
    summ = summ+ (imfParts(i)%scalefactor/f)*(imfParts(i)%m_max**f - imfParts(i)%m_min**f)
  enddo
  imfAverage = summ
  write(44, '(A, E16.5)') 'Average mass: ', imfAverage
  write(44,'(7(A16,1X))') 'Min','Max','alpha','scale','fraction','f_min','f_max'
  do i = 1, imfPartCount
    t = imfParts(i)
    write(44, '(7(E16.5, 1X))') t%m_min, t%m_max, t%alpha, t%scalefactor, t%fraction, t%f_min, t%f_max
  enddo
end subroutine TIMFPart_Normalize

real*8 function TIMFPart_getF(m)
real*8, intent(in) :: m
integer i
logical b
  i = 0
  b = .true.
  do while (b.and.(i.lt.imfPartCount))
    i =  i + 1
    if ((imfParts(i)%m_max.gt.m).and.(imfParts(i)%m_min.lt.m)) then
      TIMFPart_getF = imfParts(i)%scalefactor * m**imfParts(i)%alpha
      b = .false.
    end if
  end do
end function TIMFPart_getF

real*8 function TIMFPart_getRandomMass()
real*8 p, ps, f, fmin, u
integer i
  p = rand()
  i = 1
  ps = 0D0
  do while (i.le.imfPartCount)
    ps = ps + imfParts(i)%fraction
    if (p.le.ps) then
      p = (ps - p)/(imfParts(i)%fraction)
      exit
    endif
    i =  i + 1
  enddo
  fmin = imfParts(i)%f_min!**(imfParts(i)%alpha+1)
  f = imfParts(i)%f_max - fmin !**(imfParts(i)%alpha+1)
  u = (fmin+p*f)**(1D0/(imfParts(i)%alpha+1))
  TIMFPart_getRandomMass = u
end function TIMFPart_getRandomMass

end module IMFutils