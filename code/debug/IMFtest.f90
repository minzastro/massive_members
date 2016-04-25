program IMFtest
!use operators
use IMFutils

integer i, j, nmax
real*8 m, mmax(3), mtot
character*10 sMcl, sMMax

! 
 imfPartCount = 3
 imfParts(1)%m_min = 0.01
 imfParts(1)%m_max = 0.08
 imfParts(1)%alpha = -0.3
 imfParts(2)%m_min = 0.08
 imfParts(2)%m_max = 0.5
 imfParts(2)%alpha = -1.3
 imfParts(3)%m_min = 0.5
 imfParts(3)%m_max = 150
 imfParts(3)%alpha = -2.35
! 
!  imfPartCount = 2
!  imfParts(1)%m_min = 0.01
!  imfParts(1)%m_max = 0.5
!  imfParts(1)%alpha = -1.3
!  imfParts(2)%m_min = 0.5
!  imfParts(2)%m_max = 150
!  imfParts(2)%alpha = -2.3
nmax = 1 !0000
call TIMFPart_Normalize()

!write(*,*) imfParts(1:2)%scalefactor
!write(*,*) imfParts(1:2)%fraction
!do j = 1, 30000
  mmax(:) = 0.01
  mtot = 0D0
  do i = 1, nmax
    m = TIMFPart_getRandomMass()
    write(*,*) m
    mtot = mtot + m
    if (m.gt.mmax(1)) then
      mmax(3) = mmax(2)
      mmax(2) = mmax(1)
      mmax(1) = m
    else if (m.gt.mmax(2)) then
      mmax(3) = mmax(2)
      mmax(2) = m
    else if (m.gt.mmax(3)) then
      mmax(3) = m
    end if
  enddo
!  write(*,*) mtot, mmax(:)
!enddo

end program IMFtest