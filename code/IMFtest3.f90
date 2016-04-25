program IMFtest2
use IMFutils
use operators
!use sorting

integer i, j, n, navg, nnow , nadd
real*8 m, mmax(3), mtot, mcl, mass(100000), mest
character*10 sMcl, sMMax
logical bFlag

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

navg = mcl/imfAverage

do j = 1, 30000
  mmax(:) = 0.01
  mass(:) = 0D0
  mtot = 0D0
  bFlag = .true.
  nnow = navg
  n = 0
  do while (bFlag)
    do i = n+1, nnow
      mass(i) = TIMFPart_getRandomMass() !log10(float(i))*5d0-1D0
      mtot = mtot + mass(i)
      n = n + 1
    enddo
    if (mtot.gt.mcl) then
      call quick_sort(mass(1:nnow), mass(1:nnow), nnow)
      do while (mtot.gt.mcl)
        mtot = mtot - mass(n)
        n = n - 1        
      enddo
      if ((mcl - mtot).gt.(mtot+mass(n+1)-mcl)) then
        n = n + 1
        mtot = mtot + mass(n)
      end if
      bFlag = .false.
    else
      nadd = int((mcl - mtot)/imfAverage)+1
      nnow = n + nadd
    end if
  enddo
  mmax(1) = mass(n)
  mmax(2) = mass(n-1)
  mmax(3) = mass(n-2)
  write(*,*) n, mtot, mmax(:)
enddo

end program IMFtest2