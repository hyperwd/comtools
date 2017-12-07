终端多路复用，构建复杂的开发环境，很棒

sudo apt install tmux

-------使用----
开始一个新的会话
$ tmux new -s <session_name>
    $ top
    $ ctrl-b d 从会话中脱离，但会话不会断开(ctrl d 会话开)
$ tmux 再次创建新会话并进入tmux(tmux a 接入第一个可用的会话)
    $ ctrl-b ? 获取帮助

$ tmux attach-session -t session
$ tmux list-session
$ tmux new-session <会话名>
$ tmux attach-session -t <会话名>
$ tmux rename-session -t <会话名>
$ tmux choose-session -t <会话名>
$ tmux kill-session -t <会话名>


快捷键参考

按下 Ctrl-b 后的快捷键如下：
基础

    ? 获取帮助信息

会话管理

    s 列出所有会话
    $ 重命名当前的会话
    d 断开当前的会话

窗口管理，一个会话下的多个窗口

    c 创建一个新窗口
    , 重命名当前窗口
    w 列出所有窗口
    % 水平分割窗口
    " 竖直分割窗口
    n 选择下一个窗口
    p 选择上一个窗口
    0~9 选择0~9对应的窗口
		exit离开窗格

窗格管理,一个会话下多个工作面板

    % 创建一个水平窗格
    " 创建一个竖直窗格
    h 将光标移入左侧的窗格*
    j 将光标移入下方的窗格*
    l 将光标移入右侧的窗格*
    k 将光标移入上方的窗格*
    q 显示窗格的编号
    o 在窗格间切换
    } 与下一个窗格交换位置
    { 与上一个窗格交换位置
    ! 在新窗口中显示当前窗格
    x 关闭当前窗格> 要使用带“*”的快捷键需要提前配置，配置方法可以参考上文的“在窗格间移动光标”一节。——译者注

其他

    t 在当前窗格显示时间

窗格间移动，ctrl-b 光标建


今天部署测试服务器环境

使用到了tmux 刚开始我把tmux想象成了像omzsh这种shell 但是被指出是错误的，tmux类似于在shell里面的软件。我还真是第一次接触到这个概念。

首先安装

brew install tmux

我在安装的时候并没有遇到什么问题。

 

1. open session

$ tmux new-session -s basic
或者
$ tmux new -s basic

-s参数表示session名称，如果不加-s参数，那么Tmux默认会新建一个以数字(下标从0开始)命名的session，并默认打开一个window。打开一个session后，后续的所有控制Tmux本身的快捷键都需要加前缀，默认是 Ctrl+b ，以下把前缀按键称为Prefix。

2. detach session 
想要暂时离开Tmux，回到终端环境时，可以通过快捷键 Prefix+d (d for detach)。要注意的时，即使是detach的状态，Tmux中在运行的程序还会继续运行。想要回到Tmux session时，只需执行：

$ tmux attach -t basic

-t参数可以指定要attach的session。

3. list session 
终端中执行 tmux ls (ls for list session)可以列出当前有多少个session。如果已经在session中，执行 Prefix+s (s for session)可以列出当前有多少个session，并且可通过上、下键选择要进入的session。

4. kill session 
要真正关闭一个session，可以在终端下执行命令 tmux kill-session -t basic ，其中-t参数表示session名称。

二. window 
如果说session是个不可见的东西，那么window就是我们输入、执行命令的地方。一个session可以包含多个window。把window类比成iTerm2中的标签应该就理解了。

1. 创建window 
在创建session的时候默认会创建一个以"数字下标+bash"命名的window，并且名称随着bash中执行的不同命令而变化。在新建session时可以通过-n参数指定默认打开的window名称，比如通过 tmux new -s basic -n win 命名一个win名称的window。也可以随时通过 Prefix+, 来修改window名称。

2. 切换window 
类似标签，我们可以通过一些快捷键在同一个session下的多个window之间切换。比如:

Prefix+p (p for previous)：切换到上一个window。 
Prefix+n (n for next): 切换到下一个window。 
Prefix+0 : 切换到0号window，依次类推，1、2、3... 
Prefix+w (w for windows): 列出当前session所有window，通过上、下键可以选择切换到指定window。

3. 关闭window 
Prefix+& : 关闭当前window。

三. pane 
一个window可以切割成多个pane，也就是所谓的分屏，算是Tmux的核心功能之一。

1. 分屏 
Prefix+% : 垂直分屏，用一条垂线把当前窗口分成左右两屏。 
Prefix+" : 水平分屏，用一条水平线把当前窗口分成上下两屏。

2. 切换pane 
默认情况下，被选中(激活状态下)的pane会被绿色边框高亮突显出来。 
Prefix+o : 依次切换当前窗口下的各个pane。 
Prefix+Up|Down|Left|Right : 根据按箭方向选择切换到某个pane。 
Prefix+Space (空格键): 对当前窗口下的所有pane重新排列布局，每按一次，换一种样式。 
Prefix+z : 最大化当前pane。再按一次后恢复。

3. 关闭pane 
Prefix+x : 关闭当前使用中的pane。

关于Tmux的三个核心概念(session、window和pane)及其基本用法已经介绍完毕。接下来的是一些个性化配置和奇技淫巧，包括重新绑定快捷键、自定义快捷键、UI样式、鼠标支持、复制粘贴等等，这些可配置的高级功能也是Tmux受人推崇的原因。Tmux配置文件推荐放在~/.tmux.conf文件中，避免某个用户修改配置影响到其他用户，修改配置文件后要经过reload操作才会在已打开session中生效。

一. 重新绑定快捷键 
Tmux的很多默认配置不够友好，需要个人重新定义。

unbind C-b
set -g prefix C-a
 
bind C-a send-prefix
 
bind r source-file ~/.tmux.conf \; display "tmux.conf reload!"
 
bind | split-window -h
bind - split-window -v
 
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
 
set -g base-index 1
set -g pane-base-index 1

第1-2行表示重新定义Prefix，把默认的 Ctrl+b 换成 Ctrl+a ，便于单手操作。 
第4行重新定义 Ctrl+a 组合键，当 Prefix + Ctrl+a 按下后，等同于原先 Ctrl+a 功能，解决Ctrl+a被设置为Prefix后已有快捷键失效的问题，也就是说只要按下两次 Ctrl+a ，就能实现原先终端下回到行首的功能。 
第6行定义新的快捷键 Prefix+r ，重新加载Tmux配置文件，避免每次要进入命令模式reload配置。 
第8-9行重新定义分屏快捷键。使用 Prefix+| 代替 Prefix+% 实现垂直分屏，使用 Prefix+- 代替 Prefix+" 实现水平分屏。|和-的符号本身就可以表示分屏线形状，非常直观。 
第11-14行重新定义上下左右方向键，遵循vi习惯。定义以后，任何需要上下左右方向键的场景都可以用hjkl替代。 
第16行表示将window的起始下标设为1。因为标准键盘的0在9后面， Prefix + 0/1/2 ...切换不便。 
第17行表示将pane的起始下标设为1。理由同上。

二. 鼠标支持

set-window-option -g mode-mouse on
set -g mouse-select-pane on
set -g mouse-resize-pane on
set -g mouse-select-window on

第1行表示启用鼠标。虽然Tmux推荐用键盘完成所有操作，但是对现代开发人员来说，纯键盘操作的习惯并非那么容易养成，因此启用鼠标配置成为标配。 
第2行表示支持鼠标选择pane。 
第3行表示支持鼠标调整pane大小。 
第4行表示支持鼠标选择window。

三. UI样式调整

setw -g window-status-current-fg white
setw -g window-status-current-bg red
setw -g window-status-current-attr bright
 
set -g status-justify left
 
setw -g monitor-activity on

第1-3行表示状态栏中window标签的高亮样式，默认是绿底黑字，设置后当前window红底白字显示。 
第5行表示状态栏中window列表左对齐排列。 
第7行表示非当前window有内容更新时显示在状态栏。

四. 复制粘贴 
默认情况下，按 Prefix+[ 进入复制模式，按回车(Enter)退出复制模式。可以通过配置在复制模式中使用vi习惯操作:

setw -g mode-keys vi

在复制模式下，按空格键(Space)开始复制，按回车(Enter)完成复制，并退出模式，按 Prefix+] 粘贴。这些快捷键也可以通过以下配置进行修改，使操作更加靠近vi。

unbind [
bind Escape copy-mode
unbind p
bind p paste-buffer
bind -t vi-copy 'v' begin-selection
bind -t vi-copy 'y' copy-selection

第1-2行表示重新绑定Escape键， Prefix+Escape 为进入复制模式。 
第3-4行表示重新绑定p键， Prefix+p 为粘贴。 
第5行表示重新绑定v键， Prefix+v 为开始复制。 
第6行表示重新绑定y键， Prefix+y 为完成复制。

要查看当前复制的内容，可以在 Prefix+: 后出现的命令行中输入 show-buffer ，输入 list-buffers 可以列出所有的复制历史内容。 
关于复制粘贴，更深入的话题是Tmux和系统剪贴板之间的交互，Linux可以使用xclip，Mac可以使用tmux-MacOSX-pasteboard，不过我没有试验成功，暂时可以通过ALT + 鼠标复制内容到系统剪贴板。

五. 多屏操作 
默认情况下，一个window上只有一个pane被激活，接收键盘交互。但是某些场景下需要在多个pane中执行相同的操作，比如同时修改两台或更多台远程机器的nginx配置，这时候可以在分屏后按 Prefix+: 进入命令模式，输入 set synchronize-panes ，即可进入批量操作模式，要退出批量操作模式，再次输入 set synchronize-panes 即可。
