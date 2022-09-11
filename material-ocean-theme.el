(load-file "./material.el")

(deftheme-material
  material-ocean
  "A port of the VSCode theme 'Community Material Themes - Ocean'"
  
  ((((class color) (min-colors #xffffff)))

   ;; element colors.
   (Caret                  "#FFCC00")
   (EditorBackground       "#0F111A")
   (EditorBackgroundDarker "#090B10")

   ;;(EditorBackground     "#090B10")
   (EditorForeground     "#A6ACCD")
   ;;(EditorForeground      "gray70")
   ;;(CommentsForeground    "gray45")
   (CommentsForeground "#4b526d")
   (SelectionBackground  "#333955") ;; Original was #717CB450
   ;;(ModeBarBackground    "#090B10")
   (ModeBarBackground    "#000000")
   (ModeBarForeground    "#4B526D")
   
   (HighlightActiveBackground "#090B10")
   
   (ScrollBarForeground "#2B2C31") ;;#8F93A230
   (ScrollBarBackground "#131315") ;;#8F93A220

   (Highlight-Orange "DarkOrange2")
   (Highlight-Gray   "LightSteelBlue")

   ;; Text colors.
   (White         "#FFFFFF")
   (Black         "#000000")
   (Blue          "#82AAFF")
   (PaleBlue      "#B2CCD6")
   (Cyan          "#89DDFF")
   (Green         "#C3E88D")
   (Magenta       "#C792EA")
   (Red           "#FF5370")
   (Yellow        "#FFCB6B")
   (BrightBlack   "#464B5D")

   (DeepYellow    "#FAA452")
   (PaleRed       "#FF7777")
   (PaleOrange    "#F78C6C")

   (debug "#FF00FF") ;; ugly color for debugging.
   ))


;;;###autoload
(when (and (boundp 'custom-theme-load-path)
           load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'material-ocean)
