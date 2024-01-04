#############################################################################
# Generated by PAGE version 8.0
#  in conjunction with Tcl version 8.6
#  Jan 04, 2024 02:40:55 PM IST  platform: Linux
set vTcl(timestamp) ""
if {![info exists vTcl(borrow)]} {
    ::vTcl::MessageBox -title Error -message  "You must open project files from within PAGE."
    exit}


set vTcl(actual_gui_font_dft_desc)  TkDefaultFont
set vTcl(actual_gui_font_dft_name)  TkDefaultFont
set vTcl(actual_gui_font_text_desc)  TkTextFont
set vTcl(actual_gui_font_text_name)  TkTextFont
set vTcl(actual_gui_font_fixed_desc)  TkFixedFont
set vTcl(actual_gui_font_fixed_name)  TkFixedFont
set vTcl(actual_gui_font_menu_desc)  TkMenuFont
set vTcl(actual_gui_font_menu_name)  TkMenuFont
set vTcl(actual_gui_font_tooltip_desc)  TkDefaultFont
set vTcl(actual_gui_font_tooltip_name)  TkDefaultFont
set vTcl(actual_gui_font_treeview_desc)  TkDefaultFont
set vTcl(actual_gui_font_treeview_name)  TkDefaultFont
########################################### 
set vTcl(actual_gui_bg) #d9d9d9
set vTcl(actual_gui_fg) #000000
set vTcl(actual_gui_analog) #ececec
set vTcl(actual_gui_menu_analog) #ececec
set vTcl(actual_gui_menu_bg) #d9d9d9
set vTcl(actual_gui_menu_fg) #000000
set vTcl(complement_color) gray40
set vTcl(analog_color_p) #c3c3c3
set vTcl(analog_color_m) beige
set vTcl(tabfg1) black
set vTcl(tabfg2) white
set vTcl(actual_gui_menu_active_bg)  #ececec
set vTcl(actual_gui_menu_active_fg)  #000000
########################################### 
set vTcl(pr,autoalias) 1
set vTcl(pr,relative_placement) 1
set vTcl(mode) Relative
set vTcl(project_theme) notsodark



proc vTclWindow.top1 {base} {
    global vTcl
    if {$base == ""} {
        set base .top1
    }
    if {[winfo exists $base]} {
        wm deiconify $base; return
    }
    set top $base
    set target $base
    ###################
    # CREATING WIDGETS
    ###################
    vTcl::widgets::core::toplevel::createCmd $top -class Toplevel \
        -menu $top.m55 -background #919191 -highlightbackground #919191 \
        -highlightcolor black 
    wm focusmodel $top passive
    wm geometry $top 776x565+384+164
    update
    # set in toplevel.wgt.
    global vTcl
    global img_list
    set vTcl(save,dflt,origin) 0
    wm maxsize $top 1521 930
    wm minsize $top 1 1
    wm overrideredirect $top 0
    wm resizable $top 1 1
    wm deiconify $top
    set toptitle "USB-C DB Frame Builder"
    wm title $top $toptitle
    namespace eval ::widgets::${top}::ClassOption {}
    set ::widgets::${top}::ClassOption(-toptitle) $toptitle
    vTcl:DefineAlias "$top" "Toplevel1" vTcl:Toplevel:WidgetProc "" 1
    set vTcl(real_top) {}
    text "$top.tex47" \
        -background white -font "-family {DejaVu Sans} -size 10" \
        -foreground black -height 136 -highlightcolor black \
        -insertbackground black -selectbackground #d9d9d9 \
        -selectforeground black -tabstyle wordprocessor -undo 1 -width 568 \
        -wrap word 
    $top.tex47 configure -font "TkTextFont"
    $top.tex47 insert end text
    vTcl:DefineAlias "$top.tex47" "Toutput" vTcl:WidgetProc "Toplevel1" 1
    button "$top.but47" \
        -activebackground #d9d9d9 -activeforeground black -background #919191 \
        -disabledforeground #6d6d6d -font "-family {DejaVu Sans} -size 10" \
        -foreground black -highlightbackground #919191 -highlightcolor black \
        -text "Update Frame" 
    vTcl:DefineAlias "$top.but47" "Bupdate" vTcl:WidgetProc "Toplevel1" 1
    button "$top.but48" \
        -activebackground #d9d9d9 -activeforeground black -background #919191 \
        -disabledforeground #6d6d6d -font "-family {DejaVu Sans} -size 10" \
        -foreground black -highlightbackground #919191 -highlightcolor black \
        -text "Generate Frame" 
    vTcl:DefineAlias "$top.but48" "Bgenerate" vTcl:WidgetProc "Toplevel1" 1
    labelframe "$top.lab48" \
        -font "-family {DejaVu Sans} -size 10" -foreground black \
        -relief ridge -text "Color select" -background #919191 -height 155 \
        -highlightbackground #919191 -highlightcolor black -width 100 
    vTcl:DefineAlias "$top.lab48" "LFcolorselect" vTcl:WidgetProc "Toplevel1" 1
    labelframe "$top.lab47" \
        -font "-family {DejaVu Sans} -size 10" -foreground black \
        -relief ridge -text "Display Frame" -background #919191 \
        -cursor spraycan -height 292 -highlightbackground #919191 \
        -highlightcolor black -width 397 
    vTcl:DefineAlias "$top.lab47" "LFdisplayframe" vTcl:WidgetProc "Toplevel1" 1
    label "$top.lab50" \
        -activebackground #d9d9d9 -activeforeground black -background #919191 \
        -compound center -disabledforeground #6d6d6d \
        -font "-family {DejaVu Sans} -size 10" -foreground black \
        -highlightbackground #919191 -highlightcolor black -relief solid \
        -text "Selected color" 
    vTcl:DefineAlias "$top.lab50" "Lselcolor" vTcl:WidgetProc "Toplevel1" 1
    message "$top.mes53" \
        -background #919191 -font "-family {DejaVu Sans} -size 10" \
        -foreground black -highlightbackground #919191 -highlightcolor black \
        -justify center -padx 1 -pady 1 -text "USB-C DB Frame Builder" \
        -width 202 
    vTcl:DefineAlias "$top.mes53" "Mtitle" vTcl:WidgetProc "Toplevel1" 1
    labelframe "$top.lab51" \
        -font "-family {DejaVu Sans} -size 10" -foreground black \
        -relief ridge -text "Frame select" -background #919191 -height 445 \
        -highlightbackground #919191 -highlightcolor black -width 100 
    vTcl:DefineAlias "$top.lab51" "LFselframe" vTcl:WidgetProc "Toplevel1" 1
    set site_3_0 $top.lab51
    listbox "$site_3_0.lis47" \
        -background white -disabledforeground #6d6d6d \
        -font "-family {DejaVu Sans Mono} -size 10" -foreground black \
        -height 4 -highlightbackground #919191 -highlightcolor black \
        -relief ridge -selectbackground #d9d9d9 -selectforeground black \
        -width 10 
    $site_3_0.lis47 configure -font "TkFixedFont"
    $site_3_0.lis47 insert end text
    vTcl:DefineAlias "$site_3_0.lis47" "LBselframe" vTcl:WidgetProc "Toplevel1" 1
    place $site_3_0.lis47 \
        -in $site_3_0 -x 0 -relx 0.013 -y 0 -rely 0.041 -width 0 \
        -relwidth 0.96 -height 0 -relheight 0.949 -anchor nw \
        -bordermode ignore 
    button "$top.but49" \
        -activebackground #d9d9d9 -activeforeground black -background #919191 \
        -disabledforeground #6d6d6d -font "-family {DejaVu Sans} -size 10" \
        -foreground black -highlightbackground #919191 -highlightcolor black \
        -text "Load Frame(s)" 
    vTcl:DefineAlias "$top.but49" "Bload" vTcl:WidgetProc "Toplevel1" 1
    message "$top.mes47" \
        -anchor w -background #919191 -font "-family {DejaVu Sans} -size 10" \
        -foreground black -highlightbackground #919191 -highlightcolor black \
        -padx 1 -pady 1 -relief solid -width 416 
    vTcl:DefineAlias "$top.mes47" "Mmessages" vTcl:WidgetProc "Toplevel1" 1
    ###################
    # SETTING GEOMETRY
    ###################
    place $top.tex47 \
        -in $top -x 0 -relx 0.052 -y 0 -rely 0.637 -width 0 -relwidth 0.732 \
        -height 0 -relheight 0.241 -anchor nw -bordermode ignore 
    place $top.but47 \
        -in $top -x 0 -relx 0.052 -y 0 -rely 0.549 -width 134 -relwidth 0 \
        -height 31 -relheight 0 -anchor nw -bordermode ignore 
    place $top.but48 \
        -in $top -x 0 -relx 0.052 -y 0 -rely 0.46 -width 134 -relwidth 0 \
        -height 31 -relheight 0 -anchor nw -bordermode ignore 
    place $top.lab48 \
        -in $top -x 0 -relx 0.052 -y 0 -rely 0.177 -width 0 -relwidth 0.173 \
        -height 0 -relheight 0.251 -anchor nw -bordermode ignore 
    place $top.lab47 \
        -in $top -x 0 -relx 0.271 -y 0 -rely 0.088 -width 0 -relwidth 0.512 \
        -height 0 -relheight 0.517 -anchor nw -bordermode ignore 
    place $top.lab50 \
        -in $top -x 0 -relx 0.052 -y 0 -rely 0.106 -width 0 -relwidth 0.175 \
        -height 0 -relheight 0.037 -anchor nw -bordermode ignore 
    place $top.mes53 \
        -in $top -x 0 -relx 0.327 -y 0 -rely 0.025 -width 0 -relwidth 0.345 \
        -height 0 -relheight 0.048 -anchor nw -bordermode ignore 
    place $top.lab51 \
        -in $top -x 0 -relx 0.825 -y 0 -rely 0.088 -width 0 -relwidth 0.129 \
        -height 0 -relheight 0.788 -anchor nw -bordermode ignore 
    place $top.but49 \
        -in $top -x 0 -relx 0.606 -y 0 -rely 0.903 -width 134 -relwidth 0 \
        -height 31 -relheight 0 -anchor nw -bordermode ignore 
    place $top.mes47 \
        -in $top -x 0 -relx 0.052 -y 0 -rely 0.903 -width 0 -relwidth 0.536 \
        -height 0 -relheight 0.051 -anchor nw -bordermode ignore 

    vTcl:FireEvent $base <<Ready>>
}

proc 36 {args} {return 1}


Window show .
set btop1 ""
if {$vTcl(borrow)} {
    set btop1 .bor[expr int([expr rand() * 100])]
    while {[lsearch $btop1 $vTcl(tops)] != -1} {
        set btop1 .bor[expr int([expr rand() * 100])]
    }
}
set vTcl(btop) $btop1
Window show .top1 $btop1
if {$vTcl(borrow)} {
    $btop1 configure -background plum
}

