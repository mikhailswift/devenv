#!/bin/zsh
LAYOUTFILE=$(mktemp)
cat <<EOF > $LAYOUTFILE
{
    "border": "normal",
    "floating": "auto_off",
    "layout": "splitv",
    "percent": 0.5,
    "type": "con",
    "nodes": [
        {
            "border": "normal",
            "floating": "auto_off",
            "layout": "tabbed",
            "percent": 0.5,
            "type": "con",
            "nodes": [
                {
                    "border": "pixel",
                    "current_border_width": 0,
                    "floating": "auto_off",
                    "geometry": {
                       "height": 517,
                       "width": 948,
                       "x": 964,
                       "y": 555
                    },
                    "percent": 0.333333333333333,
                    "swallows": [
                       {
                         "class": "^Slack$"
                       }
                    ],
                    "type": "con"
                },
                {
                    "border": "pixel",
                    "current_border_width": 0,
                    "floating": "auto_off",
                    "geometry": {
                       "height": 1042,
                       "width": 472,
                       "x": 484,
                       "y": 30
                    },
                    "percent": 0.333333333333333,
                    "swallows": [
                       {
                         "class": "^Yubico\\\\ Authenticator$"
                       }
                    ],
                    "type": "con"
                }
            ]
        },
        {
            "border": "pixel",
            "current_border_width": 0,
            "floating": "auto_off",
            "geometry": {
               "height": 576,
               "width": 576,
               "x": 672,
               "y": 252
            },
            "percent": 0.5,
            "swallows": [
               {
                "class": "^Chromium$",
                "instance": "^crx_mdpkiolbdkhdjpekfbkbmhigcaggjagi$"
               }
            ],
            "type": "con"
        }
    ]
}

{
    "border": "normal",
    "floating": "auto_off",
    "layout": "splitv",
    "percent": 0.5,
    "type": "con",
    "nodes": [
        {
            "border": "pixel",
            "current_border_width": 0,
            "floating": "auto_off",
            "geometry": {
               "height": 1042,
               "width": 948,
               "x": 964,
               "y": 30
            },
            "percent": 0.5,
            "swallows": [
               {
                  "class": "^discord$",
                  "title": "^\\\\.*Discord$"
               }
            ],
            "type": "con"
        },
        {
            "border": "pixel",
            "current_border_width": 0,
            "floating": "auto_off",
            "geometry": {
               "height": 600,
               "width": 800,
               "x": 0,
               "y": 0
            },
            "percent": 0.5,
            "swallows": [
               {
                 "class": "^Spotify$",
                 "title": "^Spotify\\\\ Premium$"
               }
            ],
            "type": "con"
        }
    ]
}
EOF

i3-msg "workspace 2; append_layout $LAYOUTFILE"
rm $LAYOUTFILE

(spotify &)
(discord &)
(slack &)
(yubioath-desktop &)
(chromium --profile-directory=Default --app-id=mdpkiolbdkhdjpekfbkbmhigcaggjagi &)
