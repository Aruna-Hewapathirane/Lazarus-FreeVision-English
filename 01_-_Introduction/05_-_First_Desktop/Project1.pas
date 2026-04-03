//image image.png

(*
Minimal FreeVision application
*)
//ruleral
(*
Program name, as is standard in Pascal.
*)
//code+
program Project1;

//code-

(* For FreeVision to be possible at all, the <b>App</b> unit must be included.
*)
//code+
uses
App; // TApplication
//code-

(*
Declaration for the FreeVision application.
*)
//code+
var
MyApp: TApplication;

//code-

(* The three steps are always necessary for execution.

*)

//code+
begin
MyApp.Init; // Initialize
MyApp.Run; // Execute
MyApp.Done; // Release
end.

//code-
