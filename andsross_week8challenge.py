#! usr/bin/env python3

print('Content-type: text/html\n')

html = """<!doctype html>

<html lang-'en'>
<head>
    <meta charset='utf-8'>
    <title> Tables </title>
</head>

<body>
    <h1> Top 100 Film Comparisons </h1>
    {content}
</body>
</html>"""

with open('top100moviesRT.txt') as f:
    RT100 = f.readlines()

with open('top100moviesAFI.txt') as g:
    AFI100 = g.readlines()

message = '<table border=1>\n'

for i in range(len(RT100)):
    RT100[i] = RT100[i].strip()

for i in range(len(AFI100)):
    AFI100[i] = AFI100[i].strip()

Top100 = RT100 + AFI100
Top100.sort()
Top100 = list(dict.fromkeys(Top100))

rank = range(1,100)

RT_Rank = { k:v for (k,v) in zip(RT100, rank)}
AFI_Rank = { k:v for (k,v) in zip(AFI100, rank)}

message += '<tr>\n <td>Movie</td> <td>AFI Rank</td> <td>RT Rank</td></tr>\n'

for movie in Top100:
    RT = RT_Rank.get(movie)
    AFI = AFI_Rank.get(movie)
    message += '<tr>\n'
    message += '<td>{}</td>\n'.format(movie)
    if AFI:
        message += '<td>{}</td>\n'.format(AFI_Rank[movie])
    else:
        message += '<td>--</td>\n'
    if RT:
        message += '<td>{}</td>\n'.format(RT_Rank[movie])
    else:
        message += '<td>--</td>\n'

message += '</table>'

html = html.format(content=message)

print(html)

