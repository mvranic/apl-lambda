 uDisplay←{
⍝V: V=8, R=PH-20170224-13:05, C=PH-19960419-16:04, M=FNSDEV(mUTIL)
⍝0: Display nested structure.
⍝2: ⍺ As vtENUM(0 1)
⍝3: ⍵ As vtVARIANT
⍝4: _ As vtCHAR[;]
⍝5: FST: StaticTypeChk
⍝
    ⎕IO←0
    ⎕ML←0

    ⍺←0
    chars←⍺⊃('..''''|-')(⎕AV[⎕IO+222 221 223 220 230 225])  ⍝ ... ⍺: 0-clunky, 1-smooth.

    tl tr bl br vt hz←chars                                 ⍝ ... Top left, top right, ...

    ⍝____________________________
    ⍝ ... Box with type and axes.
    ⍝¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
    _box←{
⍝2: ⍺ As {vtCHAR vtUINT vtUINT}
⍝3: ⍵ As vtSTRING|vtCHAR[;]
⍝4: _ As vtCHAR[;]
       vrt hrz←(¯1+⍴⍵)⍴¨vt hz                               ⍝ ... Vert. and horiz. lines.
       top←(hz,'⊖→')[⎕IO+¯1↑⍺],hrz                          ⍝ ... Upper border with axis.
       bot←(⊃⍺),hrz                                         ⍝ ... Lower border with type.
       rgt←tr,vt,vrt,br                                     ⍝ ... Right side with corners.
       lax←(vt,'⌽↓')[⎕IO+¯1↓1↓⍺],¨⊂vrt                      ⍝ ... Left side(s) with axes,
       lft←⍉tl,(↑lax),bl                                    ⍝ ... and corners.
       lft,(top⍪⍵⍪bot),rgt                                  ⍝ ... Fully boxed array.
    }

    _axes←{(-2⌈⍴⍴⍵)↑1+×⍴⍵}                                  ⍝ ... Array axis types.
    _trim←{(~1 1⍷∧⌿⍵=' ')/⍵}                                ⍝ ... Remove extra blank cols.
    _line←{(6≠10|⎕DR' '⍵)⊃' -'}                             ⍝ ... underline for atom.
    _char←{⍬≡⍴⍵:hz ⋄ (⊃⍵∊'¯',⎕D)⊃'#~'}∘⍕                    ⍝ ... Simple scalar type.
    _type←{{(1=⍴⍵)⊃'+'⍵}∪,_char¨⍵}                          ⍝ ... Simple array type.
    _open←{16::(1⌈⍴⍵)⍴⊂'[ref]' ⋄ (1⌈⍴⍵)⍴⍵}                  ⍝ ... Expose null axes.
    _deco←{⍺←_type _open ⍵ ⋄ ⍺,_axes ⍵}                     ⍝ ... Type and axes vector.

    ⍝____________________________
    ⍝ ... Recursively box arrays:
    ⍝¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
    {
⍝3: ⍵ As vtVARIANT
⍝4: _ As vtCHAR[;]
       0=≡⍵:' '⍪(_open ⎕FMT ⍵)⍪_line ⍵                      ⍝ ... Simple scalar.
       1 ⍬≡(≡⍵)(⍴⍵):'∇' 0 0 _box ⎕FMT ⍵                     ⍝ ... Object rep: ⎕OR.
       1=≡⍵:(_deco ⍵)_box _open ⎕FMT _open ⍵                ⍝ ... Simple array.
       ('∊'_deco ⍵)_box _trim ⎕FMT ∇¨_open ⍵                ⍝ ... Nested array.
    }⍵
 }
