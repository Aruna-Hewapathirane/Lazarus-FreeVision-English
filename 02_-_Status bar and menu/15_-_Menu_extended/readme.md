# 02 - Status Line and Menu
## 15 - Extended Menu

![image.png](image.png)

Add multiple menu items.

For clarity, this is done by splitting the menu items.

---
For custom commands, you need to define command code.

It is recommended to use values ​​> 1000 to avoid conflicts with the standard code.

```pascal
const
cmList = 1002; // File list
cmAbout = 1001; // Display About
```

For a menu, you need to inherit **InitMenuBar**.

```pascal
type
TMyApp = object(TApplication)

procedure InitStatusLine; virtual; // Status line
procedure InitMenuBar; virtual; // Menu

end;

```

You can also split the menu items using pointers.

Whether you nest or split it is a matter of preference.

You can insert a blank line using **NewLine**.

It is recommended to write **...** after the label if a dialog box opens for a menu item.

```pascal

procedure TMyApp.InitMenuBar;

var

R: TRect; // Rectangle for the menu bar position.

M: PMenu; // Entire menu
SM0, SM1, // Submenu

M0_0, M0_1, M0_2, M1_0: PMenuItem; // Simple menu items

begin

GetExtent(R);

R.B.Y := R.A.Y + 1;

M1_0 := NewItem('~A~bout...', '', kbNoKey, cmAbout, hcNoContext, nil);

SM1 := NewSubMenu('~Help', hcNoContext, NewMenu(M1_0), nil); 

M0_2 := NewItem('~B~end', 'Alt-X', kbAltX, cmQuit, hcNoContext, nil); 
M0_1 := NewLine(M0_2); 
M0_0 := NewItem('~L~list', 'F2', kbF2, cmList, hcNoContext, M0_1); 
SM0 := NewSubMenu('~File', hcNoContext, NewMenu(M0_0), SM1); 

M := NewMenu(SM0); 

MenuBar := New(PMenuBar, Init(R, M)); 
end;
```
