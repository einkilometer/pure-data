<div class="nav nav-top">

<div class="nav-forward">

[Chapter 1: Introduction \>](1.introduction.htm)

</div>

</div>

<div id="toc">

<img src="resources/icon.png" id="logo" alt="pd icon" />

# Pure Data Manual

## Updated for Pd version 0.57-0

### Table of contents:

1.  <a href="1.introduction.htm" id="s1"><strong>Introduction</strong></a>
    1.  [Guide to the documentation](1.introduction.htm#s1.1)
    2.  [The Help menu](1.introduction.htm#s1.2)
    3.  [Other resources](1.introduction.htm#s1.3)
    4.  [Other flavors](1.introduction.htm#s1.4)
2.  <a href="2.theory.of.operation.htm" id="s2"><strong>Theory of operation</strong></a>
    1.  [Overview](2.theory.of.operation.htm#s2.1)
        1.  [The main window, canvases, and printout](2.theory.of.operation.htm#s2.1.1)
        2.  [Object boxes](2.theory.of.operation.htm#s2.1.2)
        3.  [Message and GUI boxes](2.theory.of.operation.htm#s2.1.3)
        4.  [Patches and files](2.theory.of.operation.htm#s2.1.4)
    2.  [Editing Pd patches](2.theory.of.operation.htm#s2.2)
        1.  [Edit and run mode](2.theory.of.operation.htm#s2.2.1)
        2.  [Creating boxes](2.theory.of.operation.htm#s2.2.2)
        3.  [Selecting items and moving them or "tidying them up"](2.theory.of.operation.htm#s2.2.3)
        4.  [Delete, cut, copy and paste boxes](2.theory.of.operation.htm#s2.2.4)
        5.  [Changing the text of objects, messages and comments](2.theory.of.operation.htm#s2.2.5)
        6.  [Connecting and disconnecting boxes](2.theory.of.operation.htm#s2.2.6)
        7.  [Context menu for 'Properties', 'Open' and 'Help'](2.theory.of.operation.htm#s2.2.7)
    3.  [Advanced patch editing](2.theory.of.operation.htm#s2.3)
        1.  [Tab navigation](2.theory.of.operation.htm#s2.3.1)
        2.  [Autopatching](2.theory.of.operation.htm#s2.3.2)
        3.  [Duplicate connections](2.theory.of.operation.htm#s2.3.3)
        4.  [Managing connections with the shift key](2.theory.of.operation.htm#s2.3.4)
        5.  [(Dis)Connect selection](2.theory.of.operation.htm#s2.3.5)
        6.  [Triggerize](2.theory.of.operation.htm#s2.3.6)
        7.  [Paste replace](2.theory.of.operation.htm#s2.3.7)
    4.  [Messages](2.theory.of.operation.htm#s2.4)
        1.  [Message types (selectors)](2.theory.of.operation.htm#s2.4.1)
        2.  [Floats and numerical precision](2.theory.of.operation.htm#s2.4.2)
        3.  [Depth first message passing](2.theory.of.operation.htm#s2.4.3)
        4.  [Hot and cold inlets and right to left outlet order](2.theory.of.operation.htm#s2.4.4)
        5.  [Message boxes](2.theory.of.operation.htm#s2.4.5)
        6.  [Escaping characters](2.theory.of.operation.htm#s2.4.6)
    5.  [Audio signals](2.theory.of.operation.htm#s2.5)
        1.  [Sample rate and format](2.theory.of.operation.htm#s2.5.1)
        2.  [Tilde objects and audio connections](2.theory.of.operation.htm#s2.5.2)
        3.  [Converting audio to and from messages](2.theory.of.operation.htm#s2.5.3)
        4.  [Switching and blocking](2.theory.of.operation.htm#s2.5.4)
        5.  [Nonlocal signal connections](2.theory.of.operation.htm#s2.5.5)
        6.  [Multichannel signals](2.theory.of.operation.htm#s2.5.6)
    6.  [Scheduling](2.theory.of.operation.htm#s2.6)
        1.  [Audio and messages](2.theory.of.operation.htm#s2.6.1)
        2.  [Computation load](2.theory.of.operation.htm#s2.6.2)
        3.  [Determinism](2.theory.of.operation.htm#s2.6.3)
    7.  [Semantics](2.theory.of.operation.htm#s2.7)
        1.  [Creation of objects](2.theory.of.operation.htm#s2.7.1)
        2.  [Persistence of data](2.theory.of.operation.htm#s2.7.2)
        3.  [Message passing](2.theory.of.operation.htm#s2.7.3)
        4.  [Inlets and lists](2.theory.of.operation.htm#s2.7.4)
        5.  [Special cases for 0/1-element lists](2.theory.of.operation.htm#s2.7.5)
        6.  [Dollar signs](2.theory.of.operation.htm#s2.7.6)
    8.  [Subpatches](2.theory.of.operation.htm#s2.8)
        1.  [Abstractions](2.theory.of.operation.htm#s2.8.1)
        2.  [Graph-on-parent subpatches](2.theory.of.operation.htm#s2.8.2)
    9.  [Arrays](2.theory.of.operation.htm#s2.9)
    10. [Data structures](2.theory.of.operation.htm#s2.10)
        1.  [Traversal](2.theory.of.operation.htm#s2.10.1)
        2.  [Accessing and changing data](2.theory.of.operation.htm#s2.10.2)
        3.  [Editing](2.theory.of.operation.htm#s2.10.3)
        4.  [Limitations](2.theory.of.operation.htm#s2.10.4)
    11. [Pd vs. MAX](2.theory.of.operation.htm#s2.11)
        1.  [Differences between Pd and MAX](2.theory.of.operation.htm#s2.11.1)
        2.  [Running Pd inside MAX with the \[pd~\] external](2.theory.of.operation.htm#s2.11.2)
        3.  [The Cyclone library](2.theory.of.operation.htm#s2.11.3)
3.  <a href="3.installing.configuring.htm" id="s3"><strong>Installing and configuring Pd</strong></a>
    1.  [Installing Pd](3.installing.configuring.htm#s3.1)
        1.  [macOS](3.installing.configuring.htm#s3.1.1)
        2.  [Microsoft Windows](3.installing.configuring.htm#s3.1.2)
        3.  [Linux](3.installing.configuring.htm#s3.1.3)
    2.  [Running Pd via the command line](3.installing.configuring.htm#s3.2)
    3.  [Testing and configuring Audio and MIDI](3.installing.configuring.htm#s3.3)
        1.  [Audio settings](3.installing.configuring.htm#s3.3.1)
        2.  [MIDI settings](3.installing.configuring.htm#s3.3.2)
    4.  [Path and startup](3.installing.configuring.htm#s3.4)
        1.  [Startup flags](3.installing.configuring.htm#s3.4.1)
            1.  [Font flags](3.installing.configuring.htm#s3.4.1.1)
            2.  [Path flag](3.installing.configuring.htm#s3.4.1.2)
            3.  [Flags for Audio and MIDI multiple devices and sleepgrain](3.installing.configuring.htm#s3.4.1.3)
            4.  [Sample rate flag](3.installing.configuring.htm#s3.4.1.4)
            5.  [Audio buffer size and block size flags](3.installing.configuring.htm#s3.4.1.5)
4.  <a href="4.externals.htm" id="s4"><strong>Externals</strong></a>
    1.  [External objects & libraries](4.externals.htm#s4.1)
        1.  [Vanilla objects, internals & externals](4.externals.htm#s4.1.1)
        2.  [Types of external objects](4.externals.htm#s4.1.2)
            1.  [Compiled objects](4.externals.htm#s4.1.2.1)
            2.  [Abstractions](4.externals.htm#s4.1.2.2)
        3.  [External libraries](4.externals.htm#s4.1.3)
        4.  [Types of external libraries](4.externals.htm#s4.1.4)
        5.  [Wrapping up section 4.1](4.externals.htm#s4.1.5)
    2.  [GUI (.tcl) plugins](4.externals.htm#s4.2)
    3.  [Installing externals and GUI plugins](4.externals.htm#s4.3)
        1.  [Where to include externals and GUI plugins](4.externals.htm#s4.3.1)
        2.  [How to download externals and GUI plugins from Pd](4.externals.htm#s4.3.2)
    4.  [Loading externals](4.externals.htm#s4.4)
        1.  [Using the \[declare\] object](4.externals.htm#s4.4.1)
            1.  [\[declare -path\]](4.externals.htm#s4.4.1.1)
            2.  [\[declare -lib\]](4.externals.htm#s4.4.1.2)
        2.  [Load via path and startup](4.externals.htm#s4.4.2)
            1.  [User added path](4.externals.htm#s4.4.2.1)
            2.  [Startup](4.externals.htm#s4.4.2.2)
        3.  [Load using slash declarations](4.externals.htm#s4.4.3)
    5.  [How external binaries are loaded](4.externals.htm#s4.5)
        1.  [Overriding objects (externals and native)](4.externals.htm#s4.5.1)
    6.  [Search order in Pd for objects and files](4.externals.htm#s4.6)
5.  <a href="5.current.status.htm" id="s5"><strong>Current status</strong></a>
    1.  [Release notes](5.current.status.htm#s5.1)
6.  <a href="6.building.from.source.htm" id="s6"><strong>Building Pd from source</strong></a>
    1.  [Requirements](6.building.from.source.htm#s6.1)
    2.  [General autotools build steps](6.building.from.source.htm#s6.2)
    3.  [Building Pd for Linux](6.building.from.source.htm#s6.3)
    4.  [Building Pd for BSD](6.building.from.source.htm#s6.4)
        1.  [FreeBSD](6.building.from.source.htm#s6.4.1)
        2.  [OpenBSD](6.building.from.source.htm#s6.4.2)
        3.  [NetBSD](6.building.from.source.htm#s6.4.3)
    5.  [Building Pd for macOS](6.building.from.source.htm#s6.5)
        1.  [macOS app bundle](6.building.from.source.htm#s6.5.1)
        2.  [Supplementary macOS build scripts](6.building.from.source.htm#s6.5.2)
        3.  [Preferences](6.building.from.source.htm#s6.5.3)
        4.  [Code signing](6.building.from.source.htm#s6.5.4)
        5.  [Privacy permissions](6.building.from.source.htm#s6.5.5)
        6.  [Font issues with macOS 10.15+](6.building.from.source.htm#s6.5.6)
        7.  [Dark mode](6.building.from.source.htm#s6.5.7)
        8.  [Debugging releases](6.building.from.source.htm#s6.5.8)
    6.  [Building Pd for Microsoft Windows](6.building.from.source.htm#s6.6)
        1.  [Building a Pd application](6.building.from.source.htm#s6.6.1)
        2.  [Pd application directory](6.building.from.source.htm#s6.6.2)
            1.  [Windows app bundle helpers](6.building.from.source.htm#s6.6.2.1)
        3.  [pdfontloader](6.building.from.source.htm#s6.6.3)
        4.  [ASIO support](6.building.from.source.htm#s6.6.4)
    7.  [Cross-compilation for Windows on Linux](6.building.from.source.htm#s6.7)
    8.  [Makefile build](6.building.from.source.htm#s6.8)
    9.  [Troubleshooting](6.building.from.source.htm#s6.9)

</div>

<div class="nav nav-bottom">

<div class="nav-back">

</div>

<div class="nav-home">

</div>

<div class="nav-forward">

[Chapter 1: Introduction \>](1.introduction.htm)

</div>

</div>
