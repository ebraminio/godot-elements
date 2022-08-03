extends GridContainer

var Element = preload("Element.tscn")

func add_space(): add_child(VBoxContainer.new())

var elementsText = """H,Hydrogen
He,Helium
Li,Lithium
Be,Beryllium
B,Boron
C,Carbon
N,Nitrogen
O,Oxygen
F,Fluorine
Ne,Neon
Na,Sodium
Mg,Magnesium
Al,Aluminium
Si,Silicon
P,Phosphorus
S,Sulfur
Cl,Chlorine
Ar,Argon
K,Potassium
Ca,Calcium
Sc,Scandium
Ti,Titanium
V,Vanadium
Cr,Chromium
Mn,Manganese
Fe,Iron
Co,Cobalt
Ni,Nickel
Cu,Copper
Zn,Zinc
Ga,Gallium
Ge,Germanium
As,Arsenic
Se,Selenium
Br,Bromine
Kr,Krypton
Rb,Rubidium
Sr,Strontium
Y,Yttrium
Zr,Zirconium
Nb,Niobium
Mo,Molybdenum
Tc,Technetium
Ru,Ruthenium
Rh,Rhodium
Pd,Palladium
Ag,Silver
Cd,Cadmium
In,Indium
Sn,Tin
Sb,Antimony
Te,Tellurium
I,Iodine
Xe,Xenon
Cs,Caesium
Ba,Barium
La,Lanthanum
Ce,Cerium
Pr,Praseodymium
Nd,Neodymium
Pm,Promethium
Sm,Samarium
Eu,Europium
Gd,Gadolinium
Tb,Terbium
Dy,Dysprosium
Ho,Holmium
Er,Erbium
Tm,Thulium
Yb,Ytterbium
Lu,Lutetium
Hf,Hafnium
Ta,Tantalum
W,Tungsten
Re,Rhenium
Os,Osmium
Ir,Iridium
Pt,Platinum
Au,Gold
Hg,Mercury
Tl,Thallium
Pb,Lead
Bi,Bismuth
Po,Polonium
At,Astatine
Rn,Radon
Fr,Francium
Ra,Radium
Ac,Actinium
Th,Thorium
Pa,Protactinium
U,Uranium
Np,Neptunium
Pu,Plutonium
Am,Americium
Cm,Curium
Bk,Berkelium
Cf,Californium
Es,Einsteinium
Fm,Fermium
Md,Mendelevium
No,Nobelium
Lr,Lawrencium
Rf,Rutherfordium
Db,Dubnium
Sg,Seaborgium
Bh,Bohrium
Hs,Hassium
Mt,Meitnerium
Ds,Darmstadtium
Rg,Roentgenium
Cn,Copernicium
Nh,Nihonium
Fl,Flerovium
Mc,Moscovium
Lv,Livermorium
Ts,Tennessine
Og,Oganesson"""
var elements = elementsText.split("\n")

func add_element(i):
	var color = 0xffc0c0ff # Transition metals
	match i:
		3, 11, 19, 37, 55, 87: color = 0xff9d9dff # Alkali metals
		4, 12, 20, 38, 56, 88: color = 0xffdeadff # Alkaline earth metals
		57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71: color = 0xffbfffff # Lanthanides
		89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103: color = 0xff99ccff # Actinides
		1, 6, 7, 8, 15, 16, 34: color = 0xa0ffa0ff # Other nonmetals
		5, 14, 32, 33, 51, 52: color = 0xcccc99ff # Metalloids
		13, 31, 49, 50, 81, 82, 83, 84, 113, 114, 115, 116: color = 0xccccccff # Other nonmetals
		9, 17, 35, 53, 85, 117: color = 0xffff99ff # Halogens
		2, 10, 18, 36, 54, 86, 118: color = 0xc0ffffff # Noble gases
	
	var element = Element.instance()
	element.number = i
	var details = elements[i - 1].split(",")
	element.chemical_symbol = details[0]
	element.chemical_name = details[1]
	element.relative_atomic_mass = i
	var theme = Theme.new()
	var style_box = StyleBoxFlat.new()
	style_box.corner_radius_bottom_left = 10
	style_box.corner_radius_bottom_right = 10
	style_box.corner_radius_top_left = 10
	style_box.corner_radius_top_right = 10
	style_box.bg_color = Color(color)
	theme.set_stylebox("panel", "Panel", style_box)
	element.theme = theme
	add_child(element)

func _ready():
	var i = 1
	add_element(i)
	i += 1
	for _j in range(16): add_space()
	add_element(i)
	i += 1
	for _j in range(2):
		for _k in range(2):
			add_element(i)
			i += 1
		for _k in range(10): add_space()
		for _k in range(6):
			add_element(i)
			i += 1
	for _j in range(2):
		for _k in range(18):
			add_element(i)
			i += 1
	for _j in range(2):
		for _k in range(2):
			add_element(i)
			i += 1
		i += 14
		for _k in range(16):
			add_element(i)
			i += 1
	for j in [57, 89]:
		i = j
		for _k in range(2): add_space()
		for _k in range(14):
			add_element(i)
			i += 1
		for _k in range(2): add_space()
