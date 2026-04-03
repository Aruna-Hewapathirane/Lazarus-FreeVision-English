# 02 - Status Line and Menu
## 00 - Status Line

![image.png](image.png)

Changing the status line.

The status line is used to display important information and hotkeys.

---
Several units are needed for the status line.

```pascal
uses
App, // TApplication
Objects, // Window area (TRect)
Drivers, // Hotkey
Views, // Events (cmQuit)
Menus; // Status line
```

To make changes, you must inherit from TApplication.

In this example, the status line is changed; to do this, you must override the procedure **InitStatusLine**.

```pascal
procedure TMyApp.InitStatusLine;

var
R: TRect; // Rectangle for the status line position.

begin
GetExtent(R); // Returns the size/position of the app, normally 0, 0, 80, 24.

R.A.Y := R.B.Y - 1; // Position of the status line, set to the bottom line of the app.

StatusLine := New(PStatusLine, Init(R, NewStatusDef(0, $FFFF, NewStatusKey('~Alt+X~ Exit Program', kbAltX, cmQuit, nil), nil)));

end;

```

To use the new status line, you must declare the decimal instead of **TApplication**.

```pascal
var
MyApp: TMyApp;

```

This remains the same.

```pascal
begin
MyApp.Init; // Initialize
MyApp.Run; // Execute
MyApp.Done; // Release
end.

```
