VALIDATIONS = {
  presence: 'validate_presence_of',
  uniqueness: 'validate_uniqueness_of',
  numericality: 'validate_numericality_of',
  inclusion: 'validate_inclusion_of',
  belong_to: 'belong_to',
  have_many: 'have_many',
  have_and_belong_to_many: 'have_and_belong_to_many'
}.freeze

RSpec.shared_examples 'model_shared_spec' do |factory, attribs, subj = true|
  subject { create(factory) } if subj

  it 'has a valid factory' do
    expect(create(factory)).to be_valid
  end

  attribs.each do |attr|
    attr.each do |k, v|
      if v.instance_of?(Array)
        v.each do |validation|
          if validation.instance_of?(Hash)
            method = validation.keys[0]
            options = validation.values[0]
            it { is_expected.to(options.inject(send(VALIDATIONS[method], k)) { |o, p| o.send(p[0], p[1]) }) }
          else
            it { is_expected.to(send(VALIDATIONS[validation], k)) }
          end
        end
      else
        it { is_expected.to(send(VALIDATIONS[v], k)) }
      end
    end
  end
end
