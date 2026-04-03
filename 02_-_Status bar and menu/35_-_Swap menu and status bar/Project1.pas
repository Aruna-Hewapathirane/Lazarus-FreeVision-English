//image image.png
(*
The entire menu and status bar can be replaced at runtime.
For example, to make the application multilingual.
To do this, the current component is removed and the new one inserted.
In this example, there is one German and one English component.
*)

//ruleral
program Project1;

uses
App, // TApplication
Objects, // Window area (TRect)
Drivers, // Hotkey
Views, // Event (cmQuit)
Menus, // Status bar
Dialogs; // Dialogs

const
cmAbout = 1001; // Display About
cmPara = 1003; // Parameters
cmMenuEnlish = 1005; // English
cmMenuGerman = 1006; // German

type
(*
Component declaration
*)

/code+

TMyApp = object(TApplication)

procedure InitStatusLine; virtual; // Status bar
procedure InitMenuBar; virtual; // Menu

procedure HandleEvent(var Event: TEvent); virtual; // Event handler

private

menuGer, menuEng: PMenuView; // The two menus
StatusGer, StatusEng: PStatusLine; // The two status lines

end;

/code-

(*
Initialize the two status lines.

*)

/code+

procedure TMyApp.InitStatusLine;

var

R: TRect;

begin

GetExtent(R);

R.A.Y := R.B.Y - 1;


// Status line in German 
StatusGer := New(PStatusLine, Init(R, NewStatusDef(0, $FFFF, 
NewStatusKey('~Alt+X~ Quit program', kbAltX, cmQuit, 
NewStatusKey('~F10~ Menu', kbF10, cmMenu, 
NewStatusKey('~F1~ Help', kbF1, cmHelp, nil))), nil))); 

// Status line in English 
StatusEng := New(PStatusLine, Init(R, NewStatusDef(0, $FFFF, 
NewStatusKey('~Alt+X~ Exit', kbAltX, cmQuit, 
NewStatusKey('~F10~ Menu', kbF10, cmMenu, 
NewStatusKey('~F1~ Help', kbF1, cmHelp, nil))), nil))); 

StatusLine := StatusGer; // German by default

end;

//code-

(*
Initialize the two menus.

*)

//code+

procedure TMyApp.InitMenuBar;

var
R: TRect;

begin

GetExtent(R);

R.B.Y := R.A.Y + 1;


// Menu German 
menuGer := New(PMenuBar, Init(R, NewMenu( 
NewSubMenu('~File', hcNoContext, NewMenu( 
NewItem('S~c~hliessen', 'Alt-F3', kbAltF3, cmClose, hcNoContext, 
NewLine( 
NewItem('~B~end', 'Alt-X', kbAltX, cmQuit, hcNoContext, nil)))), 
NewSubMenu('~Options', hcNoContext, NewMenu( 
NewItem('~Parameter...', '', kbF2, cmPara, hcNoContext, 
NewLine( 
NewItem('~D~eutsch', 'Alt-D', kbAltD, cmMenuGerman, hcNoContext, 
NewItem('~English', 'Alt-E', kbAltE, cmMenuEnlish, hcNoContext, nil))))), 
NewSubMenu('~Help', hcNoContext, NewMenu( 
NewItem('~A~bout...', '', kbNoKey, cmAbout, hcNoContext, nil)), nil)))))); 

// Menu in English 
menuEng := New(PMenuBar, Init(R, NewMenu( 
NewSubMenu('~F~ile', hcNoContext, NewMenu( 
NewItem('~C~lose', 'Alt-F3', kbAltF3, cmClose, hcNoContext, 
NewLine( 
NewItem('E~x~it', 'Alt-X', kbAltX, cmQuit, hcNoContext, nil)))), 
NewSubMenu('~O~ptions', hcNoContext, NewMenu( 
NewItem('~P~arameters...', '', kbF2, cmPara, hcNoContext, 
NewLine( 
NewItem('German', 'Alt-D', kbAltD, cmMenuGerman, hcNoContext, 
NewItem('English', 'Alt-E', kbAltE, cmMenuEnlish, hcNoContext, nil))))),

NewSubMenu('~H~elp', hcNoContext, NewMenu(
NewItem('~A~bout...', '', kbNoKey, cmAbout, hcNoContext, nil)), nil))))));

MenuBar := menuGer; // German by default

end;

//code-

(*
Replacing the components
*)

//code+

procedure TMyApp.HandleEvent(var Event: TEvent);

var
Rect: TRect; // Rectangle for the status bar position.

begin

GetExtent(Rect);

Rect.A.Y := Rect.B.Y - 1;

inherited HandleEvent(Event);

if Event.What = evCommand then begin

case Event.Command of

cmAbout: begin

/ An About dialog

end;

/ // Menu in English
cmMenuEnlish: begin

/ // Swap menu

Delete(MenuBar); // Remove old menu

MenuBar := menuEng; // Assign new menu

Insert(MenuBar); // Insert new menu

/ // Swap status line

Delete(StatusLine); // Remove old status line

StatusLine := StatusEng; // Assign new status line

Insert(StatusLine); // Insert new status line
end;

/ // Menu in German
cmMenuGerman: begin

Delete(MenuBar);

MenuBar := menuGer;

Insert(MenuBar);

Delete(StatusLine);

StatusLine := StatusGer;

Insert(StatusLine);

end;

cmPara: begin

/ // A parameter dialog
end;

else begin

Exit;

end;

end;

end;

ClearEvent(Event);

end;

//code-

var
MyApp: TMyApp;

begin

MyApp.Init; // Initialize

MyApp.Run; // Execute

MyApp.Done; // Release

end.
