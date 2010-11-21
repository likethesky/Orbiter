require 'common'

--h.set_defaults = function(T) end

h.set_defaults {
    inline_style = [[
    
#sddm
{	margin: 0;
	padding: 0;
	z-index: 30
}

#sddm li
{	margin: 0;
	padding: 0;
	list-style: none;
	float: left;
	font: bold 11px arial
}

#sddm li a
{	display: block;
	margin: 0 1px 0 0;
	padding: 4px 10px;
	width: 60px;
	background: #5970B2;
	color: #FFF;
	text-align: center;
	text-decoration: none
}

#sddm li a:hover
{	background: #49A3FF}

#sddm div
{	position: absolute;
	visibility: hidden;
	margin: 0;
	padding: 0;
	background: #EAEBD8;
	border: 1px solid #5970B2
}

	#sddm div a
	{	position: relative;
		display: block;
		margin: 0;
		padding: 5px 10px;
		width: auto;
		white-space: nowrap;
		text-align: left;
		text-decoration: none;
		background: #EAEBD8;
		color: #2875DE;
		font: 11px arial
	}

	#sddm div a:hover
	{	background: #49A3FF;
		color: #FFF
	}   
    
]],
    inline_script = [[

<!--
var timeout         = 500;
var closetimer		= 0;
var ddmenuitem      = 0;

// open hidden layer
function mopen(id)
{	
	// cancel close timer
	mcancelclosetime();

	// close old layer
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';

	// get new layer and show it
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.visibility = 'visible';

}
// close showed layer
function mclose()
{
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}

// go close timer
function mclosetime()
{
	closetimer = window.setTimeout(mclose, timeout);
}

// cancel close timer
function mcancelclosetime()
{
	if(closetimer)
	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}

// close layer when click-out
document.onclick = mclose; 
// -->
    ]],
}
--[[
	<li><a href="#" onmouseover="mopen('m1')" onmouseout="mclosetime()">Home</a>
		<div id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
		<a href="#">HTML DropDown</a>
		<a href="#">DHTML DropDown menu</a>
		<a href="#">JavaScript DropDown</a>
		<a href="#">DropDown Menu</a>
		<a href="#">CSS DropDown</a>
		</div>
	</li>
]]

local a,div = h.tags 'a,div'

function item(label,idx,items)
    local id = "m"..idx
    local link = a { href='#',onmouseover="mopen('"..id.."')",onmouseout="mclosetime()", label}
    local idiv = div {id = id, onmouseover="mcancelclosetime()" ,onmouseout="mclosetime()"}
    for i,ip in ipairs(items) do
        idiv[i] = h.link(ip[2],ip[1])
    end
    return { link, idiv }
end

function dropdown_menu(items)


end

h2 = h.tags 'h2'

print( h {
    h2 'So What?',
    h.list { id = "sddm";
        item('First',1,{
            {'Impressions','#'},
            {'sight','#'}        
        }),
        item('Second',2,{
            {'thoughts','#'},
            {'sight','#'}
        })
    }
})