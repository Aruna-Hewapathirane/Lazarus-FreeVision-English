# 01 - Introduction
## 00 - Introduction

**Free Vision** is the free version of Turbo Vision, which was included with Turbo Pascal.

Many people think that FV is something outdated from the DOS era.

For normal desktop applications, this is true.

But there are applications where it is still very practical today.

A very good example is **Telnet** access.

Or a server that doesn't have a graphical interface.

Which Linux enthusiast hasn't had to deal with **vi** or **nemo** at some point?

If Linux had an FV editor built in, life would be much easier. ;-)

For this reason, I'm currently working with **Free Vision**.

I've gleaned a lot of information from the FV source code, and I also found some on an old floppy disk from a Turbo Pascal book.

You can also find some information online.

Since I want to share my experience, I'm creating this tutorial.

I hope it's understandable, even though it probably has a lot of spelling mistakes. :-D

If anyone has suggestions or sees any errors, they can share their feedback in the German Lazarus forum. ;-)
<a href="">http://www.lazarusforum.de/viewtopic.php?f=22&t=11063&p=98205&hilit=freevision#p98205</a>

The source code for the tutorial can all be downloaded from the main page.

It's a ZIP file.

---
**Notes on the code:**

Free Vision uses code page 437. Therefore, for correct rendering of umlauts, they should be used as character constants.


```pascal

ä = #132 Ä = #142
ö = #148 Ö = #153
ü = #129 Ü = #154

```

**General Note:**
If you want to change text at runtime, e.g., **Label**, **StaticText**, caution is advised.

Since the text is stored as **PString**, it is important to ensure that sufficient memory is reserved for the text in the constructor (Init).

The simplest way to do this is as follows, thus leaving enough space for **world**.

```pascal

StaticText := new(PStaticText, Init(Rect, 'Hello '));

StaticText^.Text^ := 'Hello world';

```

**TListBox**

Caution is advised when using the **TListBox** component. The **TList** assigned here must be cleaned up manually using a **Destructor**.

Examples can be found in the **Lists and ListBoxes** chapter.

**General Note for 64-bit systems:**
Errors may occur with 64-bit code, especially concerning functions that use **FormatStr**.</s> This is unfortunately quite noticeable in the row and column display of the windows.

**Turbo-Vision**

This tutorial contains elements that are **not** 100% compatible with **Turbo-Vision**.

Certain components and functions were only introduced with **Free-Vision** by **FPC**.

For example, **TabSheet** is one such component.

There are also functions that are only available in Turbo-Vision.
