//image image.png

(*
A Hello World with FreeVision.

The text is displayed in a message box.

*)

//ruler

//code+
program Project1;

uses

App, MsgBox;

var

MyApp: TApplication;

begin

MyApp.Init;

MessageBox('Hello World!', nil, mfOKButton);

// MyApp.Run; // If it should continue.

MyApp.Done;

end.

//code-
