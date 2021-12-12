from django import forms
from keys.models import Th, Er


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
            'Th_Intro': '소개',
        }


class ErForm(forms.ModelForm):
    class Meta:
        model = Er  # 사용할 모델
        fields = ['Er_Name',
                  'Er_Num'
                  ]
        labels = {
            'Er_Name': '매장 이름',
            'Er_Num': '매장 번호'
        }

