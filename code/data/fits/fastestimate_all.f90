program fastestimate
!use operators
real*8 mass(3), mtot, avg(0:3)
real*8 estim(3), merr(3)
integer iErr, N, iMass, i, j, k
character*(100) sFile, sData, s
real*8 parM(3,3,3), parN(3,3,3)

call GetArg(1, sFile)
!call GetArg(2, s)
!mtot = s
open(81, file='../fits/all_fits_average.2', status='OLD')
  do i = 1, 3
    read(81, *) parM(:, i, 1)
  enddo
  do i = 1, 3
    read(81, *) parN(:, i, 1)
  enddo
close(81)

open(81, file='../fits/all_fits_medians.2', status='OLD')
  do i = 1, 3
    read(81, *) parM(:, i, 2)
  enddo
  do i = 1, 3
    read(81, *) parN(:, i, 2)
  enddo
close(81)

open(81, file='../fits/all_fits_maximum.2', status='OLD')
  do i = 1, 3
    read(81, *) parN(:, i, 3)
  enddo
close(81)

!write(*,*) n, parM(:,:), parN(:,:)
j=0
open(88, file=sFile, status='OLD')
  iErr = 0
  do while(.true.)
    read(88,*, iostat=iErr) n, mtot, mass(:)
    if (iErr.ne.0) then
      exit
    end if
    j=j+1
    do k = 1, 3
      do i = 1, 3
        estim(i) = getEstN(mass(i), i, k)
        merr(i) = dabs(estim(i) - dble(n))
      enddo
      write(60+k,*) n, mtot, estim(1:3), merr(1:3)
      if (k.lt.3) then
        do i = 1, 3
          estim(i) = getEstM(mass(i), i, k)
          merr(i) = dabs(estim(i) - dble(mtot))
        enddo
      else
        estim(:) = estim(:)*0.36
        merr(:) = dabs(estim(:) - dble(mtot))
      endif
      write(70+k,*) n, mtot, estim(1:3), merr(1:3)
    enddo !k
  enddo
close(88)

contains
real*8 function getEstN(m, i, j)
real*8 m
integer i, j
  getEstN = parN(1,i,j)*m**parN(2,i,j)*(150D0-m)**parN(3,i,j)
end function getEstN

real*8 function getEstM(m, i, j)
real*8 m
integer i, j
  getEstM = parM(1,i,j)*m**parM(2,i,j)*(150D0-m)**parM(3,i,j)
end function getEstM

end program fastestimate
