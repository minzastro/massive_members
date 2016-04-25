program IMFtest2
use IMFutils
use operators

integer i, j, n
real*8 m, mmax(3), mtot, mcl
character*10 sMcl, sMMax

call GetArg(1, sMMax)
call GetArg(2, sMcl)

imfPartCount = 3
imfParts(1)%m_min = 0.01
imfParts(1)%m_max = 0.08
imfParts(1)%alpha = -0.3
imfParts(2)%m_min = 0.08
imfParts(2)%m_max = 0.5
imfParts(2)%alpha = -1.3
imfParts(3)%m_min = 0.5
imfParts(3)%m_max = sMMax
imfParts(3)%alpha = -2.35

mcl = sMcl

call TIMFPart_Normalize()
!write(*,*) imfParts(1:2)%scalefactor
!write(*,*) imfParts(1:2)%fraction
do j = 1, 30000
  mmax(:) = 0.01
  mtot = 0D0
  n = 0
  do while (mtot.le.mcl)
    m = TIMFPart_getRandomMass() !log10(float(i))*5d0-1D0
    mtot = mtot + m
!    write(*,'(2(E18.8, 2X))') m, TIMFPart_getF(m)
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
    n = n + 1
  enddo
  write(*,*) n, mcl, mmax(:)
enddo

end program IMFtest2