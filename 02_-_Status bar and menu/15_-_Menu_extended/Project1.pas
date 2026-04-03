//image image.png
(*
Add multiple menu items.

Here, this is also done in a split format for clarity.

*)
//ruleral
program Project1;

uses

App, // TApplication

Objects, // Window area (TRect)

Drivers, // Hotkey

Views, // Event (cmQuit)

Menu; // Status bar

(*
For custom commands, you need to define command code.

It is recommended to use values ​​> 1000 to avoid conflicts with the standard codes.

*)
//code+
const
cmList = 1002; // File list
cmAbout = 1001; // Display About

//code-

(*
For a menu, you need to inherit <b>InitMenuBar</b>.

*)

//code+
type
TMyApp = object(TApplication)

procedure InitStatusLine; virtual; // Status bar

procedure InitMenuBar; virtual; // Menu

end;

/code-

procedure TMyApp.InitStatusLine;

var

R: TRect; // Rectangle for the status bar position.

P0: PStatusDef; // Pointer to the entire entry.

P1, P2, P3: PStatusItem; // Pointer to the individual hotkeys.

begin

GetExtent(R);

R.A.Y := R.B.Y - 1;

P3 := NewStatusKey('~F1~ Help', kbF1, cmHelp, nil);

P2 := NewStatusKey('~F10~ Menu', kbF10, cmMenu, P3);

P1 := NewStatusKey('~Alt+X~ Exit Program', kbAltX, cmQuit, P2);

P0 := NewStatusDef(0, $FFFF, P1, nil);

StatusLine := New(PStatusLine, Init(R, P0));

end;

(*) Menu items can also be split using pointers.
Whether you nest or split them is a matter of preference.
``` can be used to insert a blank line.
``` is recommended if a dialog box opens for a menu item.

``` after the label is ```.

*)

`/``
` ...
``
``
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
`
` R.B.Y := R.A.Y + 1; 

M1_0 := NewItem('~A~bout...', '', kbNoKey, cmAbout, hcNoContext, nil); 
SM1 := NewSubMenu('~Help', hcNoContext, NewMenu(M1_0), nil); 

M0_2 := NewItem('~B~end', 'Alt-X', kbAltX, cmQuit, hcNoContext, nil); 
M0_1 := NewLine(M0_2); 
M0_0 := NewItem('~L~list', 'F2', kbF2, cmList, hcNoContext, M0_1); 
SM0 := NewSubMenu('~File', hcNoContext, NewMenu(M0_0), SM1); 

M := NewMenu(SM0); 

MenuBar := New(PMenuBar, Init(R, M)); 
end; 
//code-

var 
MyApp: TMyApp;

begin 
MyApp.Init; // Initialize 
MyApp.Run; // Process 
MyApp.Done; // Release
end.
