import glob

span_code = open('span.html').read()
html_pages = glob.glob('gh-pages/sasoptpy/**/*html', recursive=True)

for i in html_pages:
    print('Processing', i)
    f = open(i, 'r', encoding='utf-8')
    alltext = f.readlines()
    f.close()
    if not r'version_switch' in alltext:
        print('Version switch is getting appended')
        for index, line in enumerate(alltext):
            if 'sphinxsidebarwrapper' in line:
                alltext.insert(index+1, span_code)
            if r'</head>' in line:
                headline = index
        relative = '../' * (i.count('/')-2)
        alltext.insert(headline-1, '    <script src="{}_static/js/version.js"></script>\n'.format(relative))
        f = open(i, 'w', encoding='utf-8')
        f.write("".join(alltext))
        f.close()
