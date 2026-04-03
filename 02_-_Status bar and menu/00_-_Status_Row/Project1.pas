//image image.png
(*
Changing the status line.
The status line is used to display important information and hotkeys.
*)
//ruleral
program Project1;

(*
Various units are needed for the status line.
*)
//code+
uses
App, // TApplication
Objects, // Window area (TRect)
Drivers, // Hotkey
Views, // Event (cmQuit)
Menus; // Status line
//code-

(*
To change something, you have to inherit TApplication.

In this example, the status line is changed; to do this, you have to override the procedure <b>InitStatusLine</b>.

*)
//code+
type
TMyApp = object(TApplication)

procedure InitStatusLine; virtual;

end;

//code.


``` (*
The new method for the status bar.

<b>GetExtent(Rect);</b> returns the size of the window.

<b>A</b> is the top-left position and <b>B</b> is the bottom-right position.

To make the hotkey more visible, enclose it in <b>~xxx~</b>.

*)

//code+

procedure TMyApp.InitStatusLine;

var

R: TRect; // Rectangle for the status bar position.

begin

GetExtent(R); // Returns the size/position of the app, normally 0, 0, 80, 24.

R.A.Y := R.B.Y - 1; // Position of the status bar, set to the bottom line of the app.


StatusLine := New(PStatusLine, Init(R, NewStatusDef(0, $FFFF, NewStatusKey('~Alt+X~ Exit Program', kbAltX, cmQuit, nil), nil)));

end;

//code-

(*
To use the new status line, you must declare the decimal instead of <b>TApplication</b>.

*)

//code+

var
MyApp: TMyApp;

//code-

(*
This remains the same.

*)

//code+
begin
MyApp.Init; // Initialize
MyApp.Run; // Execute
MyApp.Done; // Release
end.

//code-
