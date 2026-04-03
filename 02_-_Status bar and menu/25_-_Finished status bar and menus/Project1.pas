//image image.png
(*
There are pre-made items for the status bar and the menu, but I prefer to create them myself.

The pre-made items are only available in English.

The status bar is textless; the only thing it displays is quick commands. (cmQuit, cmMenu, cmClose, cmZoom, cmNext, cmPrev)
Unless you use <b>OS shell</b> or <b>Exit</b>, nothing happens.

*)

//ruleral
program Project1;

uses

App, // TApplication
Objects, // Window area (TRect)
Drivers, // Hotkey
Views, // Event (cmQuit)
MenuS; // Status bar

type
TMyApp = object(TApplication)

procedure InitStatusLine; virtual; // Status bar
procedure InitMenuBar; virtual; // Menu

end;

(*
Using `StdStatusKeys(...)` creates a status line, but as described above, no text is displayed.

*)

//code+

procedure TMyApp.InitStatusLine;

var

R: TRect;

begin

GetExtent(R);

R.A.Y := R.B.Y - 1;

StatusLine := New(PStatusLine, Init(R, NewStatusDef(0, $FFFF, StdStatusKeys(nil), nil)));

end;

//code-

(*
There are 3 ready-made menu items: File, Edit, and Window, but they are in English.

*)

//code+

procedure TMyApp.InitMenuBar;

var

R: TRect;

begin

GetExtent(R);

R.B.Y := R.A.Y + 1;

MenuBar := New(PMenuBar, Init(R, NewMenu( 
NewSubMenu('~File', hcNoContext, NewMenu( 
StdFileMenuItems (nil)), 
NewSubMenu('~Edit', hcNoContext, NewMenu( 
StdEditMenuItems (nil)), 
NewSubMenu('~Window', hcNoContext, NewMenu( 
StdWindowMenuItems(nil)), nil)))))); 
end; 
//code-

var 
MyApp: TMyApp;

begin 
MyApp.Init; // Initialize 
MyApp.Run; // Process 
MyApp.Done; // Release
end.
