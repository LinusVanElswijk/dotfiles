# Adapted from https://github.com/kovidgoyal/kitty/discussions/4447#discussioncomment-9218936

import datetime
from typing import List

from kittens.tui.images import cursor
from kitty.boss import Window, get_boss
from kitty.fast_data_types import Screen, add_timer
from kitty.rgb import to_color
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    Formatter,
    TabBarData,
    as_rgb,
    draw_attributed_string,
    draw_tab_with_powerline,
    draw_title,
)

timer_id: int | None = None
tabs: List[TabBarData] = []


def draw_tab_with_slider(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> None:
    if tab.is_active:
        screen.draw("")
    elif index == 1:
        screen.draw("")
    else:
        screen.draw(" ")

    draw_title(draw_data, screen, tab, index, max_title_length)

    if tab.is_active:
        screen.draw("")
    elif is_last:
        screen.draw("")
    else:
        screen.draw(" ")


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    global timer_id

    if index == 1:
        fg, bg = screen.cursor.fg, screen.cursor.bg
        draw_cells(draw_data, screen, create_cells_left())

        if tab.is_active:
            screen.draw(" ")
        else:
            screen.cursor.fg = screen.cursor.bg
            screen.cursor.bg = bg
            screen.draw(" ")
            screen.cursor.fg = fg

    if timer_id is None:
        timer_id = add_timer(_redraw_tab_bar, 2.0, True)

    # draw_tab_with_slider(draw_data, screen, tab, before, max_title_length, index, is_last, extra_data)
    draw_tab_with_powerline(
        draw_data, screen, tab, before, max_title_length, index, is_last, extra_data
    )

    if is_last:
        draw_cells(draw_data, screen, [get_window_title()])
        draw_cells(draw_data, screen, create_cells_right(), float_right=True)

    return screen.cursor.x


def draw_cells(
    draw_data: DrawData, screen: Screen, cells, float_right: bool = False
) -> None:
    def draw_filled(cell):
        bg = to_color(c.get("color")) if c.get("color") else tab_bg
        fg = default_bg

        screen.cursor.bg = as_rgb(int(bg))
        screen.cursor.fg = as_rgb(int(fg))

        icon = c.get("icon")
        if icon:
            screen.draw(f" {icon}")
        text = c["text"]
        screen.draw(f" {text} ")

    def draw_colored_text(cell):
        screen.cursor.bg = default_bg
        icon = c.get("icon")
        if icon:
            fg = to_color(c.get("color")) if c.get("color") else tab_fg
            screen.cursor.fg = as_rgb(int(fg))
            screen.draw(f" {icon}")
        screen.cursor.fg = tab_fg
        text = c["text"]
        screen.draw(f" {text} ")

    def cell_text_size(cell) -> int:
        return len(" ".join([cell.get("icon", ""), cell["text"]])) + 2

    # The tabs may have left some formats enabled. Disable them now.
    draw_attributed_string(Formatter.reset, screen)
    tab_bg = as_rgb(int(draw_data.inactive_bg))
    tab_fg = as_rgb(int(draw_data.inactive_fg))
    default_bg = as_rgb(int(draw_data.default_bg))

    # Drop cells that wont fit

    if float_right:
        cell_sizes = [cell_text_size(c) for c in cells]
        remaining_space = screen.columns - screen.cursor.x

        while remaining_space < sum(cell_sizes):
            cells = cells[1:]
            cell_sizes = cell_sizes[1:]
        padding_size = remaining_space - sum(cell_sizes)
        screen.draw(" " * padding_size)

    for c in cells:
        if c.get("style", "") == "filled":
            draw_filled(c)
        else:
            draw_colored_text(c)


def create_cells_left():
    return [get_kitty()]


def create_cells_right():
    cells = [
        # get_cmd(),
        get_layout(),
    ]
    return [c for c in cells if c is not None]


def get_kitty():
    return {"color": "#8AADF4", "text": "󰓩 ", "style": "filled"}


def get_time():
    now = datetime.datetime.now().strftime("%H:%M")
    return {"icon": " ", "color": "#8AADF4", "text": now}


def get_date():
    today = datetime.date.today().strftime("%e %b")
    return {"icon": "󰃵 ", "color": "#8AADF4", "text": today}


def get_layout():
    def text():
        active_tab = get_boss().active_tab
        return active_tab.current_layout.name if active_tab else ""

    return {"icon": " ", "color": "#A6DA95", "text": text()}


def get_window_title():
    def text():
        window = get_boss().active_window
        return  window.title if window else ""

    return {"color": "#8AADF4", "text": text()}


def get_windows():
    def window_symbol(window: Window) -> str:
        # if window.needs_attention:
        #     return " "
        if window.is_active:
            return " "
        else:
            return " "

    def text():
        active_tab = get_boss().active_tab
        if active_tab is None:
            return ""

        return " ".join(window_symbol(w) for w in active_tab.windows)

    return {"color": "#8AADF4", "text": text()}


def get_cmd():
    def text():
        active_window = get_boss().active_window
        return " ".join(active_window.child.cmdline) if active_window else ""

    def icon():
        active_window = get_boss().active_window
        terminal_icon = active_window and active_window.at_prompt
        return " " if terminal_icon else " "

    return {"icon": icon(), "color": "#8bd5ca", "text": text()}


def get_static_text(text: str):
    return {"text": text}


def _redraw_tab_bar(timer_id):
    for tm in get_boss().all_tab_managers:
        tm.mark_tab_bar_dirty()
