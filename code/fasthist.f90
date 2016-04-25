program fasthist
real*8 sHist(150,3), mass(3), mtot
integer nHist(150,3)
integer iErr, N, iMass, i

open(88, file='data150_all', status='OLD')
iErr = 0
do while(iErr.eq.0)
  read(88,*) mtot, n, mass(:)
  do i = 1, 3
    iMass = int(mass(i))
    nHist(iMass, i) = nHist(iMass, i) + 1
    sHist(iMass, i) = sHist(iMass, i) + mtot  
  enddo
enddo
sHist(:, :) = sHist(:, :)/nHist(:,:)
do i = 1, 150
  write(*,*) i, sHist(i, 1:3)
enddo
close(88)
end program fasthist