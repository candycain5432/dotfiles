-- Crimson Temple palette
-- Pulled from the wallpaper: dark rocks, grey mist, warm clouds, and the red sun + leaves.
-- Names describe ROLES, not hues, so a future theme swap only touches this file.

local palette = {
    -- Base (rocks, mist, sky)
    bg          = "131314",  -- near-black background
    surface     = "1d2224",  -- panels, input boxes
    overlay     = "2c3335",  -- borders, highlights, inactive elements
    fg          = "d8d4ce",  -- main text (warm off-white, like the clouds)
    muted       = "8a8681",  -- dim text (the grey sky)

    -- Accents (sun and leaves)
    accent      = "e9445e",  -- the sun: primary highlight
    accent_dark = "b11d43",  -- deep leaf red: gradients, backgrounds (not for text)
    wine        = "5c0f2a",  -- darkest red: selections, subtle fills

    -- Status colors, muted so they sit in the grey world
    success     = "9aab8f",  -- sage
    warn        = "d6a36a",  -- ochre
    error       = "e9445e",  -- same as accent
    info        = "7f95a8",  -- slate blue from the mist
}

-- Build a Hyprland color string: palette.rgba(palette.accent, "ee") -> "rgba(e9445eee)"
function palette.rgba(hex, alpha)
    return "rgba(" .. hex .. (alpha or "ff") .. ")"
end

return palette
