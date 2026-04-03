# 02 - Status Bar and Menu
## 25 - Finished Status Bar and Menus

![image.png](image.png)

There are pre-made items for the status bar and menu, but I prefer to create them myself.

The pre-made items are only available in English.

The status bar is textless; the only thing it displays is quick commands (cmQuit, cmMenu, cmClose, cmZoom, cmNext, cmPrev).

Nothing happens after **OS shell** and **Exit**.



``` ---
Using **StdStatusKeys(...)**, a status line is created, but as described above, no text is displayed.

```pascal

procedure TMyApp.InitStatusLine;

var

R: TRect;

begin

GetExtent(R);

R.A.Y := R.B.Y - 1;

StatusLine := New(PStatusLine, Init(R, NewStatusDef(0, $FFFF, StdStatusKeys(nil), nil)));

end;

```

There are 3 ready-made menu items: File, Edit, and Window, but they are in English.

```pascal

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
```
