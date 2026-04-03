# 02 - Status Bar and Menu
## 30 - Menu Hints

![image.png](image.png)

Hints in the status bar of the menu items.

---
Constants of the individual hints.

It's best to use hcxxx names for these.

```pascal
const

cmList = 1002; // File list
cmAbout = 1001; // Display About

hcFile = 10;
hcClose = 11;
hcOption = 12;
hcFormat = 13;
hcEdit = 14;
hcHelp = 15;
hcAbout = 16;

```

The hint line must be inherited.

```pascal

procedure TMyApp.InitMenuBar;
var
R: TRect; // Rectangle for the menu bar position.

begin
GetExtent(R);
R.B.Y := R.A.Y + 1;

``` MenuBar := New(PMenuBar, Init(R, NewMenu( 
NewSubMenu('~File', hcFile, NewMenu( 
NewItem('~B~end', 'Alt-X', kbAltX, cmQuit, hcClose, nil)), 

NewSubMenu('~Options', hcOption, NewMenu( 
NewItem('~F~ormat', '', kbNoKey, cmAbout, hcFormat, 
NewItem('~E~itor', '', kbNoKey, cmAbout, hcEdit, nil))), 

NewSubMenu('~Help', hcHelp, NewMenu( 
NewItem('~A~bout...', '', kbNoKey, cmAbout, hcAbout, nil)), nil)))))); 
end;
```
