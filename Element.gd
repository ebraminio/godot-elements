extends Panel

export(int) var number
export(String) var chemical_symbol
export(String) var chemical_name
export(float) var relative_atomic_mass

func _ready():
	$VBoxContainer/AtomicNumber.text = str(number)
	$VBoxContainer/ChemicalSymbol.text = chemical_symbol
	$VBoxContainer/ChemicalName.text = chemical_name
	$VBoxContainer/RelativeAtomicMass.text = str(relative_atomic_mass)
