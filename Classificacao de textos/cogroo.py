from __future__ import print_function  # Only needed for Python 2
from cogroo_interface import Cogroo
import xml.dom.minidom
from xml.dom.minidom import parse
cogroo = Cogroo.Instance()

DOMTree = xml.dom.minidom.parse("corpus/esporte.xml")
textos = DOMTree.documentElement

noticias = textos.getElementsByTagName('noticia')

for noticia in noticias:
    lema = cogroo.lemmatize(noticia.getElementsByTagName('body')[0].childNodes[0].data)

def _pos_tags(self):
        pos = {}
        pos.update({"n": "substantivo"})
        pos.update({"prop": "nome próprio"})
        pos.update({"art": "artigo"})
        pos.update({"pron": "pronome"})
        pos.update({"pron-pers": "pronome pessoal"})
        pos.update({"pron-det": "pronome determinativo"})
        pos.update({"pron-indp": "substantivo/pron-indp"})
        pos.update({"adj": "adjetivo"})
        pos.update({"n-adj": "substantivo/adjetivo"})
        pos.update({"v": "verbo"})
        pos.update({"v-fin": "verbo finitivo"})
        pos.update({"v-inf": "verbo infinitivo"})
        pos.update({"v-pcp": "verbo particípio"})
        pos.update({"v-ger": "verbo gerúndio"})
        pos.update({"num": "numeral"})
        pos.update({"prp": "preposição"})
        pos.update({"adj": "adjetivo"})
        pos.update({"conj": "conjunção"})
        pos.update({"conj-s": "conjunção subordinativa"})
        pos.update({"conj-c": "conjunção coordenativa"})
        pos.update({"intj": "interjeição"})
        pos.update({"adv": "advérbio"})
        pos.update({"xxx": "outro"})
        return pos
