//image image.png
(*
Add a menu.
*)
//ruleral
program Project1;

(*
The same units are needed for the menu as for the status bar.
*)
//code+
uses
App, // TApplication
Objects, // Window area (TRect)
Drivers, // Hotkey
Views, // Event (cmQuit)
Menus; // Status bar
//code-

(*
For a menu, you must inherit <b>InitMenuBar</b>.
*)
//code+
type
TMyApp = object(TApplication)
procedure InitStatusLine; virtual; // Status bar
procedure InitMenuBar; virtual; // Menu

end;

//code-

procedure TMyApp.InitStatusLine;

var
R: TRect; // Rectangle for the status bar position.

P0: PStatusDef; // Pointer to the entire entry.

P1, P2, P3: PStatusItem; // Pointer to the individual hotkeys.

begin

GetExtent(R); // Returns the size/position of the app, normally 0, 0, 80, 24.

R.A.Y := R.B.Y - 1; // Position of the status bar, set to the bottom line of the app.

P3 := NewStatusKey('~F1~ Help', kbF1, cmHelp, nil);

P2 := NewStatusKey('~F10~ Menu', kbF10, cmMenu, P3);

P1 := NewStatusKey('~Alt+X~ Exit Program', kbAltX, cmQuit, P2);

P0 := NewStatusDef(0, $FFFF, P1, nil);

StatusLine := New(PStatusLine, Init(R, P0));

end;

(*
Create the menu; this example has only one menu item: Exit.

In the menu, the characters highlighted with <b>~x~</b> are not only visual but also functional.

To exit, you can also press <b>[Alt+s]</b> or <b>[b]</b>.

There are also direct hotkeys for the menu items; in this example, <b>[Alt+x]</b> is for exiting.

This happens to overlap with <b>[Alt+x]</b> from the status bar, but this doesn't matter.

The menu creation structure is similar to the status bar.

The last menu item always contains <b>nil</b>.

*)

//code+

procedure TMyApp.InitMenuBar;

var

R: TRect; // Rectangle for the menu bar position.

begin

GetExtent(R);

R.B.Y := R.A.Y + 1; // Set the menu position to the top row of the app.

MenuBar := New(PMenuBar, Init(R, NewMenu(
NewSubMenu('~D~atei', hcNoContext, NewMenu(
NewItem('~B~eenden', 'Alt-X', kbAltX, cmQuit, hcNoContext,
nil)), nil))));

end;

/code-

var

MyApp: TMyApp;

begin

MyApp.Init; // Initialize

MyApp.Run; // Execute

MyApp.Done; // Release
end.
