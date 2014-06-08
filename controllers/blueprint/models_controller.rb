class ModelsController < ApplicationController
	def get_schema
        @schema = schema_for_model params[:model_name]
        render json: @schema
    end

    def schema_for_model(modelName)
        model = class_from_string modelName

        if model == nil
        	return {:error => :model_not_found}
        end

        columns = { :attributes => {} }
        model.columns_hash.each do |name, column|
            columns[:attributes][name] = { :sql_type => column.sql_type, :type => column.type, :name => name, :limit => column.limit }
        end

        model.reflect_on_all_associations.each do |association|
            if columns[:attributes].has_key? association.foreign_key and association.foreign_key != nil
                current_column = columns[:attributes][association.foreign_key]
                current_column[:association_name] = association.name
                current_column[:class_name] = association.class_name
                current_column[:plural_name] = association.plural_name
                current_column[:macro] = association.macro
            else
                if !columns.has_key? association.macro
                    columns[association.macro] = {}
                end
                macro_column = columns[association.macro]
                current_column = macro_column[association.name] = {}
                current_column[:association_name] = association.name
                current_column[:class_name] = association.class_name
                current_column[:plural_name] = association.plural_name
                current_column[:macro] = association.macro

                if association.through_reflection != nil
                    current_column[:through] = association.through_reflection.name
                end
            end
        end

        columns
    end

    def class_from_string(str)
        str.split('::').inject(Object) do |mod, class_name|
            mod.const_get(class_name)
        end
    end
end