
        Case
                AGGREGATE.TOTAL >=  Max( STG_COUPON.BILL_MINAMOUNT ) Then
                        Case When Sum(
                                Case  
                                        When STG_COUPON.COUPONTYPE = 'Auto' Then 
                                                Case 
                                                        When STG_COUPON.COUPONVALUE > 100 Then STG_COUPON.COUPONVALUE
                                                        When STG_COUPON.COUPONVALUE >= 1.0 Then STG_COUPON.COUPONVALUE*AGGREGATE.TOTAL/100.0
                                                        When STG_COUPON.COUPONVALUE > 0 Then STG_COUPON.COUPONVALUE * AGGREGATE.TOTAL
                                                        Else 0.0
                                                End
                                        When STG_COUPON.COUPONTYPE = 'Currency' Then STG_COUPON.COUPONVALUE
                                        When STG_COUPON.COUPONTYPE = 'Percentage' Then
                                                Case
                                                        When STG_COUPON.COUPONVALUE > 100.0 Then 0.0
                                                        When STG_COUPON.COUPONVALUE >= 1.0 Then STG_COUPON.COUPONVALUE*AGGREGATE.TOTAL/100.0
                                                        When STG_COUPON.COUPONVALUE > 0 Then STG_COUPON.COUPONVALUE * AGGREGATE.TOTAL
                                                        Else 0.0
                                                End
                                        Else 0.0
                                End
                        ) > Max( STG_COUPON.MAXDISCOUNT ) Then Max( STG_COUPON.MAXDISCOUNT )
                        Else Sum(
                        Case  
                        When STG_COUPON.COUPONTYPE = 'Auto' Then 
                                Case 
                                        When STG_COUPON.COUPONVALUE > 100 Then STG_COUPON.COUPONVALUE
                                        When STG_COUPON.COUPONVALUE >= 1.0 Then STG_COUPON.COUPONVALUE*AGGREGATE.TOTAL/100.0
                                        When STG_COUPON.COUPONVALUE > 0 Then STG_COUPON.COUPONVALUE * AGGREGATE.TOTAL
                                        Else 0.0
                                End
                        When STG_COUPON.COUPONTYPE = 'Currency' Then STG_COUPON.COUPONVALUE
                        When STG_COUPON.COUPONTYPE = 'Percentage' Then
                                Case
                                        When STG_COUPON.COUPONVALUE > 100.0 Then 0.0
                                        When STG_COUPON.COUPONVALUE >= 1.0 Then STG_COUPON.COUPONVALUE*AGGREGATE.TOTAL/100.0
                                        When STG_COUPON.COUPONVALUE > 0 Then STG_COUPON.COUPONVALUE * AGGREGATE.TOTAL
                                        Else 0.0
                                End
                        Else 0.0
                End
                )
                End
        Else 0.0
        End


----------------
-- SUM va MAX dung de tinh vi du co nhieu coupon ap dung cho cung 1 bill --> Logic don gian nhu sau : 
if COUPONVALUE >=  BILL_MINAMOUNT: 
        if COUPONVALUE > MAXDISCOUNT: 
                MAXDISCOUNT
        else: 
                COUPONVALUE
else: 
        0

----------------
SUM(
        Case 
                when AGGREGATE1.FEEUNIT = 'Auto' Then 
                        Case 
                                when AGGREGATE1.FEEVALUE > 100 then AGGREGATE1.FEEVALUE
                                when AGGREGATE1.FEEVALUE > 1.0 then AGGREGATE1.FEEVALUE* AGGREGATE.TOTAL/100.0
                                when AGGREGATE1.FEEVALUE > 0.0 then AGGREGATE1.FEEVALUE* AGGREGATE.TOTAL
                                Else 0.0
                        End
                        when AGGREGATE1.FEEUNIT = 'Curency' AND AGGREGATE1.FEEVALUE > 100 Then AGGREGATE1.FEEVALUE
                        when AGGREGATE1.FEEUNIT = 'Percentage' Then 
                        Case 
                                when AGGREGATE1.FEEVALUE > 100 then 0.0
                                when AGGREGATE1.FEEVALUE > 1.0 then AGGREGATE1.FEEVALUE* AGGREGATE.TOTAL/100.0
                                when AGGREGATE1.FEEVALUE > 0.0 then AGGREGATE1.FEEVALUE* AGGREGATE.TOTAL
                                Else 0.0
                        End
                Else 0.0 
        End
)
