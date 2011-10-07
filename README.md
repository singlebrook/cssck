cssck
=============

Find defunct selectors in your stylesheets.

Usage
-------------
./cssck.sh stylesheet codebase filename_filter

Example:

    ./cssck.sh trunk/foo.css trunk '*.html'

Sample Output
-------------

    jared@clover ~/git/cssck/examples(master)$ ./pf.sh 
    158 classes found
    1098 files to search
    32 align-top
    5 alignright
    79 ample
    3 archivedUser
    3 beforegroupheader
    1 bigheader
    215 body
    393 button
    160 center
    117 clean
    0 clientWidth
    2184 col
    50 col1
    14 col2
    53 col_subhead
    9 collapsable
    8 collapse_content
    9 collapse_toggle
    32 collapsed
    475 column
    0 column_normal
    95 columnarlist
    179 confidential