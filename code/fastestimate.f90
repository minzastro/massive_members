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
    getEstN = 0.98796D0*(m+7.881D0)**1.9836D0
  else if (i.eq.2) then
    getEstN = 14.3853D0*(m+1.528D0)**1.572D0
  else 
    getEstN = 35.4726D0*(m+0.4243D0)**1.4552D0
  end if
end function getEstN

real*8 function getEstM(m, i)
real*8 m
integer i
  if (i.eq.1) then
    getEstM = 0.39644D0*(m+6.76812D0)**1.964D0
  else if (i.eq.2) then
    getEstM = 5.263D0*(m+1.165D0)**1.57D0
  else 
    getEstM = 12.8471D0*(m+0.195D0)**1.4554D0
  end if
end function getEstM

end program fastestimate
