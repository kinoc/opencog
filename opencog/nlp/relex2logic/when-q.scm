; This is for when questions with verbs other than "be"
; such as "When did ytou arrive?"
; (AN June 2015)


(define when-q
	(BindLink
		(VariableList
			(TypedVariableLink
				(VariableNode "$a-parse")
				(TypeNode "ParseNode")
			)
			(TypedVariableLink
				(VariableNode "$verb")
				(TypeNode "WordInstanceNode")
			)
			(TypedVariableLink
				(VariableNode "$qVar")
				(TypeNode "WordInstanceNode")
			)
		)
		(AndLink
			(WordInstanceLink
				(VariableNode "$verb")
				(VariableNode "$a-parse")
			)
			(WordInstanceLink
				(VariableNode "$qVar")
				(VariableNode "$a-parse")
			)
			(EvaluationLink
                			(DefinedLinguisticRelationshipNode "_%atTime")
                			(ListLink
                    			(VariableNode "$verb")
                    			(VariableNode "$qVar")
                			)
            		)
			(AbsentLink
				(LemmaLink
					(VariableNode "$verb")
					(WordNode "be")
				)
			)
		)
 (ListLink
	(ExecutionOutputLink
		(GroundedSchemaNode "scm: pre-when-q-rule")
		(ListLink
			(VariableNode "$verb")
		)
	)
 )
))

; This is function is not needed. It is added so as not to break the existing
; r2l pipeline.
(define (pre-when-q-rule verb)
 (ListLink
	(when-rule (word-inst-get-word-str verb) (cog-name verb)
	)
 )
)
