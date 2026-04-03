//image image.png
(*
Menu items can also be nested.
*)
//ruleral
program Project1;

uses

App, // TApplication

Objects, // Window area (TRect)

Drivers, // Hotkey

Views, // Event (cmQuit)

Menu(s); // Status bar

const
cmList = 1002; // File list
cmAbout = 1001; // Display About

type
TMyApp = object(TApplication)

procedure InitStatusLine; virtual; // Status bar

procedure InitMenuBar; virtual; // Menu

end;

(* I nested the entries in the status bar, so no pointers are needed.
I also find this clearer than a jungle of variables.
*)
//code+

procedure TMyApp.InitStatusLine;

var
R: TRect; // Rectangle for the status bar position.

begin
GetExtent(R); R.A.Y := R.B.Y - 1;

StatusLine := New(PStatusLine, Init(R, NewStatusDef(0, $FFFF,

NewStatusKey('~Alt+X~ Exit Program', kbAltX, cmQuit,

NewStatusKey('~F10~ Menu', kbF10, cmMenu,

NewStatusKey('~F1~ Help', kbF1, cmHelp, nil))), nil)));

end;

/code-

(*
The following example demonstrates a nested menu.

The creation process is also nested.

//codetext+
File
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

//codetext-
*)

//code+

procedure TMyApp.InitMenuBar;

var

R: TRect; // Rectangle for the menu bar position.

begin

GetExtent(R);

R.B.Y := R.A.Y + 1;


``` MenuBar := New(PMenuBar, Init(R, NewMenu( 
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

//code-

var

MyApp: TMyApp;

begin

MyApp.Init; // Initialize

MyApp.Run; // Execute

MyApp.Done; // Release
end.
