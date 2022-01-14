# はじめてのけいさん - 幼児向け電卓アプリ
[AppStoreのリンク予定]()

## プライバシーポリシー
<details><summary>プライバシーポリシーについて</summary>
  
記載予定
</details>

---
 
## 1.概要
このアプリは3歳くらいの子どもを対象にした知育アプリです。

可愛い見た目やタップ音で興味を引き、デバイスに計算式を読み上げさせることで小さいお子様が目と耳で算数を楽しむことができます。

https://user-images.githubusercontent.com/53589421/148719535-9dd46fa2-74e0-4767-aec9-af69be43803b.mov

## 2.機能
### ホーム画面
- 計算を行う際に、式を1文字ずつ読み上げながら計算結果を表示します。

- ボタンをタップすると効果音が再生されます。

- 入力状況に応じて+/-ボタンを青く点滅させることで、入力を誘導しています。

- 読み上げによってスピーカーアイコンが切り替わります。

- Cボタンは入力が新しいものから1文字ずつ消していく。計算結果まで表示されている時は式をリセットします。

![電卓 Screen Shot](https://user-images.githubusercontent.com/53589421/149059277-f08b7afd-308e-4863-ba9b-507d25f91eaa.png)

### 設定画面
設定画面では`Form`内の`Picker`を使って音声や効果音などを選択することができます。

各設定項目は`UserDefaults`によって保持されます。

| 項目 | 内容 |
----|----
| 動物 | 画面上部に表示する動物を設定します。動物によって声色が変わります。 |
| 言語 | 読み上げの音声を日本語か英語に設定します。 |
| サウンド | 水色ボタンのタップ音を３種類の中から選択できます。 |
| 桁数 | 入力可能な桁数を1桁か2桁に設定します。 |

![設定画面 Screen Shot](https://user-images.githubusercontent.com/53589421/149059216-7be8fc03-2f3f-42ce-aace-753ebe2829b6.png)
![動物 Screen Shot](https://user-images.githubusercontent.com/53589421/149059686-2ded01d3-4eaa-4f4f-9382-29af43ee3932.png)

## 3.アプリの設計
| ファイル名 | 概要 |
----|----
| ContentView.swift | 電卓画面のView |
| CircleText.swift | 電卓のボタンのView |
| ConfigView.swift | 設定画面のView |
| CalcViewModel.swift | 電卓の入力を受け取り処理を返すViewModel |
| ConfigViewModel.swift | 設定をUserDefaultsで保持するViewModel |
| SpeechManager.swift | AVSpeechSynthesizerで計算式を読み上げるクラス |
| SoundPlayer.swift | AVAudioPlayerで効果音を再生するクラス |

<img width="1339" alt="設計図" src="https://user-images.githubusercontent.com/53589421/149062266-715ac7dd-09ec-4998-bea3-6bb0bdfa9b44.png">

## 4.開発環境
- Xcode 13.1 
- macOS Monterey 12.1
- iOS14.5

## 5.素材
- 画像素材  
 [いらすとや](https://www.irasutoya.com/)
- 音声素材  
 [無料効果音で遊ぼう！](https://taira-komori.jpn.org/index.html)
