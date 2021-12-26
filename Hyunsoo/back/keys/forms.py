from django import forms
from keys.models import Th, Er, ThGr


class ThemeForm(forms.ModelForm):
    class Meta:
        model = Th  # 사용할 모델
        fields = ['Th_Name',
                  'Th_Genre',
                  'Th_Diff',
                  'Th_Fear',
                  'Th_Act',
                  'Th_Intro'
                  ]
        labels = {
            'Th_Name': '테마 이름',
            'Th_Genre': '장르',
            'Th_Diff': '난이도',
            'Th_Fear': '공포도',
            'Th_Act': '활동성',
            'Th_Intro': '소개'
        }


class ErForm(forms.ModelForm):
    class Meta:
        model = Er  # 사용할 모델
        fields = ['Er_Name',
                  'Er_Num',
                  'ErAd_Num',
                  'ErAd_Add1',
                  'ErAd_Add2',
                  'ErAd_Add3',
                  'ErAd_Add4',
                  'ErAd_Add5'
                  ]
        labels = {
            'Er_Name': '매장 이름',
            'Er_Num': '매장 번호',
            'ErAd_Num': '우편 주소',
            'ErAd_Add1': '도',
            'ErAd_Add2': '시',
            'ErAd_Add3': '구',
            'ErAd_Add4': '동',
            'ErAd_Add5': '나머지 주소'
        }

class ThGrForm(forms.ModelForm):
    class Meta:
        model = ThGr
        fields = [ 
            'ThGr_pt',
            'ThGr_review'
            ]
        labels = {
            'ThGr_pt': '리뷰 평점',
            'ThGr_review': '리뷰'
        }
