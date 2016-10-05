sketch = Framer.Importer.load("imported/task@1x")
Framer.Device.background.backgroundColor = "#000"

# Setup
bg = new BackgroundLayer backgroundColor: "#000"
Framer.Defaults.Animation = curve: "ease", time: 0.2
size = 110
tasks = 7

scroll = new ScrollComponent
	contentInset: top: 128 
	width: Screen.width
	height: Screen.height
	scrollHorizontal: false
scroll.mouseWheelEnabled = true

# Navigation background
navBg = new Layer
	width: Screen.width
	height: 128
sketch.navBar.bringToFront()

navBg.style = 
	"background": "rgba(0,0,0,0.85)"
	"-webkit-backdrop-filter": "blur(60px)"

textStyle =
	fontSize: "34px"
	fontFamily: "-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Oxygen, Ubuntu, Cantarell, Fira Sans, Droid Sans, Helvetica Neue, sans-serif"
	lineHeight: "3"
	paddingLeft: "28px"
	

items = []
for item in [0...tasks]

	h = 260 + (item * 20) / tasks
	l = 60 + (item * 10) / tasks
	
	# Thumbnails
	cell = new Layer
		y: item * size 
		width: Screen.width , height: size
		backgroundColor: "hsl(#{h}, 100, #{l})"
		superLayer: scroll.content
		style: textStyle
		
	items.push(cell)
	
	cell.states.add
		selected: 
			opacity: 0.4
			y: size * 8
			backgroundColor: "#000"

	cell.on Events.Click, ->
		
		@.states.next()
		@.ignoreEvents = true	
		
		for cell in items
			if cell.index > @.index
			
				cell.animate
					properties:
						y: cell.y - size
	
			if cell.opacity is 0.4
			
				cell.animate
					properties:
						y: cell.y - size

# Items
items[0].html = "More Gooder Academy of the Ever So Smart"
items[1].html = "❝ An Interaction Design Studio ❞"
items[2].html = "Data Visualization services"
items[3].html = "Web Application design"
items[4].html = "People First products"
items[5].html = "User Experience methods"
items[6].html = "Contact Us \x584 more@gooder.academy"
