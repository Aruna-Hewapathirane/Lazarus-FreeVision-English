# 02 - Status Bar and Menu
## 10 - Menu

![image.png](image.png)

Adding a menu.

---
The same units are used for the menu as for the status bar.

```pascal
uses
App, // TApplication
Objects, // Window area (TRect)
Drivers, // Hotkey
Views, // Event (cmQuit)
Menus; // Status bar
```

For a menu, you must inherit **InitMenuBar**.

```pascal
type
TMyApp = object(TApplication)

procedure InitStatusLine; virtual; // Status bar

procedure InitMenuBar; virtual; // Menu

end;

```

Create the menu; the example has only one menu item. Exit.

In the menu, the characters highlighted with **~x~** are not only visual but also functional.

To exit, you can also press **[Alt+s]** or **[b]**.

There are also direct hotkeys for the menu items; in this example, **[Alt+x]** is for exiting.

This happens to overlap with **[Alt+x]** for the status bar, but that doesn't matter.

The menu creation structure is similar to the status bar.

The last menu item always displays **nil**.

```pascal

procedure TMyApp.InitMenuBar;

var

R: TRect; // Rectangle for the menu bar position.

begin

GetExtent(R);

R.B.Y := R.A.Y + 1; // Set the menu position to the top row of the app.


```pascal` MenuBar := New(PMenuBar, Init(R, NewMenu( 
NewSubMenu('~File', hcNoContext, NewMenu( 
NewItem('~B~end', 'Alt-X', kbAltX, cmQuit, hcNoContext, 
nil)), nil)))); 
end;
```
