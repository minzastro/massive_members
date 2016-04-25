program fastestimate
real*8 mass(3), mtot, avg(0:3)
real*8 estim(3), merr(3)
integer iErr, N, iMass, i, j, k
character*(100) sFile

Call GetArg(1, sFile)
read(*,*) n
open(88, file=sFile, status='OLD')
  iErr = 0
  do while(.true.)
    read(88,*, iostat=iErr) mtot, mass(:)
    if (iErr.ne.0) then
      exit
    end if
    do i = 1, 3
      estim(i) = getEstN(mass(i), i)
      merr(i) = estim(i) - dble(n)
    enddo
    write(77,*) n, mtot, estim(1:3), merr(1:3)
    do i = 1, 3
      estim(i) = getEstM(mass(i), i)
      merr(i) = estim(i) - dble(mtot)
    enddo
    write(78,*) n, mtot, estim(1:3), merr(1:3)
  enddo
close(88)

contains
real*8 function getEstN(m, i)
real*8 m
integer i
  if (i.eq.1) then
    getEstN = 0.00552257*(m+19.0494D0)**3.04061D0
  else if (i.eq.2) then
    getEstN = 3.78358D0*(m+3.73237D0)**1.84912D0
  else 
    getEstN = 18.7226D0*(m+0.4243D0)**1.4552D0
  end if
end function getEstN

real*8 function getEstM(m, i)
real*8 m
integer i
  if (i.eq.1) then
    getEstM = 0.00274833D0*(m+16.8141D0)**2.98422D0
  else if (i.eq.2) then
    getEstM = 1.4326D0*(m+3.16152D0)**1.84053D0
  else 
    getEstM = 6.86139D0*(m+0.941309D0)**1.58197D0
  end if
end function getEstM

end program fastestimate
