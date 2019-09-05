ms←getRemainingTimeInMillis arg;_days;deadlinems;ts;msnow
 deadlinems ts←arg
 _days←{                                      ⍝ Days since 1899-12-31 (Meeus).
     ⍺←17520902                              ⍝ start of Gregorian calendar.
     yy mm dd h m s ms←7↑⊂[⍳¯1+⍴⍴⍵]⍵         ⍝ ⎕ts-style 7-item date-time.
     D←dd+(0 60 60 1000⊥↑h m s ms)÷86400000  ⍝ day with fractional part.
     Y M←yy mm+¯1 12×⊂mm≤2                   ⍝ Jan, Feb → month 13 14.
     A←⌊Y÷100                                ⍝ century number.
     B←(⍺<0 100 100⊥↑yy mm dd)×(2-A)+⌊A÷4    ⍝ Gregorian calendar correction.
     ¯2416544+D+B+⊃+/⌊365.25 30.6×Y M+4716 1 ⍝ (fractional) days.
 }
 msnow←1000×86400∘×∘(-∘25568)∘_days ts
 ms←⌈msnow-deadlinems
