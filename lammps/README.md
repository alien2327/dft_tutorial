# Lammps tutorial page

## boundary
### parameters
- p = 주기적
- f = 비주기적이며 고정
- s = 비주기적이며 shrink-wrapped
- m = 비주기적이며 최소값으로 shrink-wrapped

shrink-wrapped는 시뮬레이션 박스의 면이 동적으로 조정되어 시뮬레이션 내 모든 원자를 밀접하게 둘러싸도록 위치가 변경됩니다. 원자가 얼마나 멀리 이동하든 간에, 박스는 항상 모든 원자를 포함하도록 크기가 조정됩니다.

그러나 특히 병렬 처리를 할 때 박스 크기의 급격한 변경은 프로세서 간의 통신 컷오프를 초과하는 갑작스러운 서브도메인 크기의 변경으로 인해 원자가 손실될 수 있습니다 (lost atom error). 이를 해결하기 위해 시뮬레이션을 시작할 때 시뮬레이션 박스의 크기를 shrink-wrapped된 구성의 크기에 가깝게 초기화하는 것이 일반적입니다. (쉽게 말해, 초기 box의 크기가 너무 큰 경우에 box가 줄어드는 속도가 너무 빨라서 프로세스 간에 계산 결과가 제대로 동기화되지 않아서 일부 원자가 계산에서 누락되버리는 문제가 발생한다는 것. 따라서 초기 box의 크기를 되도록 줄어들었을때의 box의 크기로 설정해주는것이 좋다는 것.)

## units
### real
- mass = grams/mole
- distance = Angstroms
- time = femtoseconds
- energy = kcal/mol
- velocity = Angstroms/femtosecond
- force = (kcal/mol)/Angstrom
- torque = kcal/mol
- temperature = Kelvin
- pressure = atmospheres
- dynamic viscosity = Poise
- charge = multiple of electron charge (1.0 is a proton)
- dipole = charge*Angstroms
- electric field = volts/Angstrom
- density = g/cm^dim

### metal
- mass = grams/mole
- distance = Angstroms
- time = picoseconds
- energy = eV
- velocity = Angstroms/picosecond
- force = eV/Angstrom
- torque = eV
- temperature = Kelvin
- pressure = bars
- dynamic viscosity = Poise
- charge = multiple of electron charge (1.0 is a proton)
- dipole = charge*Angstroms
- electric field = volts/Angstrom
- density = gram/cm^dim

### si
- mass = kilograms
- distance = meters
- time = seconds
- energy = Joules
- velocity = meters/second
- force = Newtons
- torque = Newton-meters
- temperature = Kelvin
- pressure = Pascals
- dynamic viscosity = Pascal*second
- charge = Coulombs (1.6021765e-19 is a proton)
- dipole = Coulombs*meters
- electric field = volts/meter
- density = kilograms/meter^dim
