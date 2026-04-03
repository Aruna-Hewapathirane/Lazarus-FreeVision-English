//image image.png
(*
Hints in the status bar of the menu items.

*)
//ruleral
program Project1;

uses

App, // TApplication

Objects, // Window area (TRect)

Drivers, // Hotkey

Views, // Event (cmQuit)

Menu; // Status bar

(*) Constants of the individual help items.
It's best to use hcxxx names for these.

*)
//code+
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

//code-

type

TMyApp = object(TApplication)

procedure InitStatusLine; virtual; // Status bar

procedure InitMenuBar; virtual; // Menu

end;

(*
The hint line must be inherited.

*)

//code+

PHintStatusLine = ^THintStatusLine;

THintStatusLine = object(TStatusLine)

function Hint(AHelpCtx : Word): ShortString; virtual;

end;

function THintStatusLine.Hint(AHelpCtx: Word): ShortString;

begin

case AHelpCtx of

hcFile: Hint := 'Manage files';

hcClose: Hint := 'Exit program';

hcOption: Hint := 'Various options';

hcFormat: Hint := 'Set format';

hcEdit: Hint := 'Editor options';

hcHelp: Hint := 'Help';

hcAbout: Hint := 'Developer Info';

else

Hint := '';

end;

end;

// code-

procedure TMyApp.InitStatusLine;

var

R: TRect;

begin

GetExtent(R);

R.A.Y := R.B.Y - 1;

StatusLine := New(PHintStatusLine, Init(R, NewStatusDef(0, $FFFF,

NewStatusKey('~Alt+X~ Exit Program', kbAltX, cmQuit,

NewStatusKey('~F10~ Menu', kbF10, cmMenu,

NewStatusKey('~F1~ Help', kbF1, cmHelp, nil))), nil)));

end;

(*) The hcxxx constant must be included in the menu.

*)

//code+

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
//code-

var

MyApp: TMyApp;

begin

MyApp.Init; // Initialize

MyApp.Run; // Execute

MyApp.Done; // Release

end.
