import 'package:flutter/material.dart';
import 'package:keys_v2/Screens/policy/common_terms_style.dart';


class Terms2Widget extends StatelessWidget with CommonTermsStyle {
  const Terms2Widget({Key key}) : super(key: key);

  Widget gridView() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black,
          ),
          right: BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 120,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                    left: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
                child: Text('구분'),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      left: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: Text('수집 이용항목'),
                ),
              ),
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
                left: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 119,
                  child: Text('회원가입'),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: Text(
                            'sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입'),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                            left: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: Text('sns 가입'),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                            left: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: Text('sns 가입'),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                            left: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: Text('sns 가입'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: 120,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                    left: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
                child: Text('구분'),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      left: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: Text('수집 이용항목'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Center(
          child: Text(
            '개인정보 처리방침',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 15),
        title('제1조 (약관의 목적)', size: 15),
        const SizedBox(height: 10),
        gridView(),
      ],
    );
  }
}