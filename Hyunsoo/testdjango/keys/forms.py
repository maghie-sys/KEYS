from django import forms
from keys.models import Th, Er


class ThemeForm(forms.ModelForm):
    class Meta:
        model = Th  # 사용할 모델
        fields = ['Th_Name',
                  'Th_Genre',
                  'Th_Nop',
                  'Th_Time',
                  'Th_Diff',
                  'Th_Intro',
                  'Th_Img1',
                  ]
        labels = {
            'Th_Name': '테마 이름',
            'Th_Genre': '장르',
            'Th_Nop' : '인원',
            'Th_Time' : '제한시간',
            'Th_Diff': '난이도',
            'Th_Intro': '소개',
            'Th_Img1': '테마 포스터',
        }


class ErForm(forms.ModelForm):
    class Meta:
        model = Er  # 사용할 모델
        fields = ['Er_Brand',
                  'Er_Name',
                  'Er_Num',
                  'Er_Add',
                  'Er_Reservation',
                  ]
        labels = {
              'Er_Brand' : '매장 브랜드',
              'Er_Name' : '매장 이름',
              'Er_Num' : '매장 전화번호',
              'Er_Add' : '매장 주소',
              'Er_Reservation' : '예약페이지',
        }