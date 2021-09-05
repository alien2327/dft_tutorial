program capacitor
!   Purpose:
!   To calculate the behavior of a capacitor as follows:
!   1.  If capacitance and voltage are known, calculate
!       charge, number of electrons, and energy stored.
!   2.  If charge and voltage are known, calculate capa-
!       citance, number of electrons, and energy stored.
!
!   Record of revisions:
!       Date        Programmer      Description of change
!       ====        ==========      =====================
!    2021/09/05     Y.H.LEE         Original code
    implicit none

    !   Data dictionary: declare constants
    real, parameter :: ELECTRON_PER_COULOMB = 6.241461E18

    !   Data dictionary: declare variable types, definitions, and units
    real :: c           !   Capacitance of the capcitor (farads).
    real :: charge      !   Charge on the capacitor (coulombs).
    real :: electrons   !   Number of electrons on the plates of the capacitor.
    real :: energy      !   Energy stored in the electric field (joules).
    integer :: type     !   Type of input data available for the calculation:
                        !       1:  C and V
                        !       2:  CHARGE and V
    real :: v           !   Voltage on the capacitor (volts).

    !   Prompt user for the type of input data available.
    write (*, 100)
    100 format (' This program calculates information about a ' &
                'capacitor.', /, ' Please specify the type of information', &
                '   1 -- capacitance and voltage ', /, &
                '   2 -- charge and voltage ', //, &
                ' Select options 1 or 2: ')
    
    !   Get response and validate it.
    do
        read (*,*) type
        if ((type == 1) .or. (type == 2)) exit
        write (*,110) type
        110 format (' Invaild response: ', I6, '. Please enter 1 or 2: ')
    end do

    !   Get additional data based upon the type of calculation.
    input: if (type == 1) then
        !   Get capacitance.
        write (*,*) 'Enter capacitance in farad: '
        read (*,*) c
        !   Get voltage.
        write (*,*) 'Enter voltage in volts: '
        read (*,*) v
    else
        !   Get charge.
        write (*,*) 'Enter charge in coulombs: '
        read (*,*) charge
        !   Get voltage.
        write (*,*) 'Enter voltage in volts: '
        read (*,*) v
    end if input

    !   Calculate the unknown quantities.
    calculate: if (type == 1) then
        charge = c * v
    else
        c = charge / v
    end if calculate
    electrons = charge * ELECTRON_PER_COULOMB
    energy = 0.5 * c * v**2

    !   Write out answers.
    write (*, 120) v, c, charge, electrons, energy
    120 format ('For this capacitor: ', /, &
                '   Voltage             = ', F10.2, ' V' ,/, &
                '   Capacitance         = ', ES10.3, ' F', /, &
                '   Total charge        = ', ES10.3, ' C', /, &
                '   Number of electrons = ', ES10.3, /, &
                '   Total energy        = ', F10.4, ' joules')
end program capacitor