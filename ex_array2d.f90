!   Used values
!   20.0 19.8 20.1 20.0 20.0 19.9
!   40.3 40.1 40.0 39.5 39.9 40.0
!   42.0 41.5 41.3 41.1 39.8 41.0
!   20.4 26.9 38.4 42.0 12.2 6.0

program generate
!   Purpose:
!       To calculate total instantaneous power supplied by a generating
!       station at each instant of time, and to calculate the average
!       power supplied by each generator over the period of measurement.
!
!   Record of revisions:
!       Date        Programmer      Description of change
!       ====        ==========      =====================
!    2021/09/07     Y.H.LEE         Original code
    implicit none

    !   Data dictionary: declare constants
    integer, parameter :: MAX_GEN = 4   !   Max number of generators
    integer, parameter :: MAX_TIME = 6  !   Max number of times measured

    !   Data dictionary: declare variable types, definitions and units 
    character(len=20) :: filename
    character(len=80) :: msg
    integer igen, itime, status
    real, dimension(MAX_TIME, MAX_GEN) :: power !   Units: MW
    real, dimension(MAX_GEN) :: power_ave       !   Units: MW
    real, dimension(MAX_TIME) :: power_sum      !   Units: MW

    !   Initialize sums to zero
    power_ave = 0
    power_sum = 0

    write (*, 1000)
    1000 format ('Enter the file name containing the input data: ')
    read (*, '(A20)') filename

    open (unit=9, file=filename, status='old', action='read', iostat=status, iomsg=msg)

    fileopen: if (status == 0) then
        read (9, *, iostat=status) power

        !   Calculate the instantaneous output power of the station at each time
        sum1: do itime = 1, MAX_TIME
            sum2: do igen = 1, MAX_GEN
                power_sum(itime) = power(itime, igen) + power_sum(itime)
            end do sum2
        end do sum1
        
        !   Calculate the average output power of each generator over the time being measured
        ave1: do igen = 1, MAX_GEN
            ave2: do itime = 1, MAX_TIME
                power_ave(igen) = power(itime, igen) + power_ave(igen)
            end do ave2
            power_ave(igen) = power_ave(igen) / real(MAX_TIME)
        end do ave1

        !   Tell users.
        out1: do itime = 1, MAX_TIME
            write (*, 1010) itime, power_sum(itime)
            1010 format ('The instantaneous power at time ', I1, ' is ', F7.2, ' MW.')
        end do out1
        out2: do igen = 1, MAX_GEN
            write (*, 1020) igen, power_ave(igen)
            1020 format ('The average power of generator ', I1, ' is ', F7.2, ' MW.')
        end do out2
    else
        write (*, 1030) msg
        1030 format ('Error: File open failed ', A)
    end if fileopen
end program generate
