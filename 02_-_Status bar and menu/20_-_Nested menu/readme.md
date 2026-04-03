# 02 - Status Bar and Menu
## 20 - Nested Menu

![image.png](image.png)

Menu items can also be nested within each other.

---
I've nested the entries in the status bar, so no pointers are needed.
I also find this clearer than a jungle of variables.

```pascal

procedure TMyApp.InitStatusLine;

var
R: TRect; // Rectangle for the status bar position.
begin
GetExtent(R);
R.A.Y := R.B.Y - 1;

```pascal


... StatusLine := New(PStatusLine, Init(R, NewStatusDef(0, $FFFF,

NewStatusKey('~Alt+X~ Exit Program', kbAltX, cmQuit,

NewStatusKey('~F10~ Menu', kbF10, cmMenu,

NewStatusKey('~F1~ Help', kbF1, cmHelp, nil))), nil)));

end;

```

The following example demonstrates a nested menu.

The menu creation process is also nested.

```File
Exit
Demo
Simple 1
Nested
Menu 0
Menu 1
Menu 2
Simple 2
Help
About
```

```pascal

procedure TMyApp.InitMenuBar;

var

R: TRect; // Rectangle for the menu bar position.

begin

GetExtent(R);

` ... R.B.Y := R.A.Y + 1;

MenuBar := New(PMenuBar, Init(R, NewMenu( 
NewSubMenu('~File', hcNoContext, NewMenu( 
NewItem('~B~end', 'Alt-X', kbAltX, cmQuit, hcNoContext, nil)), 

NewSubMenu('Dem~o~', hcNoContext, NewMenu( 
NewItem('Simple ~1~', '', kbNoKey, cmAbout, hcNoContext, 
NewSubMenu('~V~nested', hcNoContext, NewMenu( 
NewItem('Menu ~0~', '', kbNoKey, cmAbout, hcNoContext, 
NewItem('Menu ~1~', '', kbNoKey, cmAbout, hcNoContext, 
NewItem('Menu ~2~', '', kbNoKey, cmAbout, hcNoContext, nil)))), 
NewItem('Simple ~2~', '', kbNoKey, cmAbout, hcNoContext, nil)))), 

NewSubMenu('~Help', hcNoContext, NewMenu( 
NewItem('~A~bout...', '', kbNoKey, cmAbout, hcNoContext, nil)), nil)))))); 
end;
```
