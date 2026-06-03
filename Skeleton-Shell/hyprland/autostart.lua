hl.dsp.exec_cmd("qs -p ~/.local/share/Skeleton-Shell")
hl.dsp.exec_cmd(
	"pidof hypridle || hypridle -c $HOME/.cache/quickshell/Skeleton-Shell/ConfigFolder/hyprland/hypridle.conf"
)
