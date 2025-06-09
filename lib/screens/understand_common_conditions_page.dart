import 'package:flutter/material.dart';
import 'package:sukoon_setu/l10n/app_localizations.dart';

class UnderstandCommonConditions extends StatelessWidget {
  final Function(Locale)? onLocaleSelected;

  UnderstandCommonConditions({super.key, this.onLocaleSelected});



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = Localizations.of(context, AppLocalizations);

    final List<Map<String, dynamic>> conditions = [
      {'title': 'Diabetes', 'icon': "assets/images/understand_common_diseases_icon_images/diabetes.jpg", 'color': theme.colorScheme.background},
      {'title': 'Blood Pressure', 'icon': "assets/images/understand_common_diseases_icon_images/bp.jpg", 'color': Color(0xFFE3F2FD)},
      {'title': 'Asthma', 'icon': "assets/images/understand_common_diseases_icon_images/asthsma.jpg", 'color': Color(0xFFE8F5E9)},
      {'title': 'Anemia', 'icon': "assets/images/understand_common_diseases_icon_images/anemia.jpg", 'color': Color(0xFFFFF3E0)},
      {'title': 'Arthritis', 'icon': "assets/images/understand_common_diseases_icon_images/arthritis.jpg", 'color': Color(0xFFF3E5F5)},
      {'title': 'Migraine', 'icon': "assets/images/understand_common_diseases_icon_images/migrane.jpg", 'color': Color(0xFFFFFDE7)},
      {'title': 'Thyroid Disorders', 'icon': "assets/images/understand_common_diseases_icon_images/thyroid.jpg", 'color': Color(0xFFE0F2F1)},
      {'title': 'PCOS/PCOD', 'icon': "assets/images/understand_common_diseases_icon_images/PCOS.jpg", 'color': Color(0xFFEDE7F6)},
      {'title': 'Anxiety', 'icon': "assets/images/understand_common_diseases_icon_images/anxiety.jpg", 'color': Color(0xFFE1F5FE)},
      {'title': 'Depression', 'icon': "assets/images/understand_common_diseases_icon_images/depression.jpg", 'color': Color(0xFFFFF9C4)},
      {'title': 'Insomnia', 'icon': "assets/images/understand_common_diseases_icon_images/insomnia.jpg", 'color': Color(0xFFF1F8E9)},
      {'title': 'Eating Disorders', 'icon': "assets/images/understand_common_diseases_icon_images/eating disorders.jpg", 'color': Color(0xFFECEFF1)},
      {'title': 'Stress and Burnout', 'icon': "assets/images/understand_common_diseases_icon_images/stress and burnout.jpg", 'color': Color(0xFFFBE9E7)},
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        centerTitle: true,
        title: Text(
          localizations.commonMentalHealth,
          style: TextStyle(
            color: theme.appBarTheme.foregroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: conditions.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two cards per row
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            final item = conditions[index];
            return ConditionCard(
              title: item['title'],
              icon: item['icon'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ConditionDetailPage(title: item['title']),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}


class ConditionCard extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const ConditionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: theme.colorScheme.primary,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            )
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: theme.colorScheme.primary.withOpacity(0.15),
              backgroundImage: AssetImage(icon),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ConditionDetailPage extends StatelessWidget {
  final Function(Locale)? onLocaleSelected;
  final String title;

  ConditionDetailPage({Key? key, required this.title, this.onLocaleSelected}) : super(key: key);

  

String getConditionDetails(String title, BuildContext context) {
  final localizations = AppLocalizations.of(context)!;
  switch (title) {
    case 'Diabetes':
      return localizations.diabetes;
    case 'Blood Pressure':
      return '''🫀 What is Blood Pressure?
• The force of blood pushing against artery walls
• High BP (hypertension) often has no symptoms
• Can cause serious damage over time

📈 BP Levels:
• Normal: <120/80
• Elevated: 120-129/<80
• High: ≥130/80

⚠️ Symptoms (when severe):
• 🧠 Headaches
• 🤯 Dizziness
• 👀 Blurry vision
• ❤️ Chest pain
• 😴 Fatigue

✅ Prevention Tips
🥗 Low-salt diet (avoid processed foods)
🏃‍♂️ Regular exercise
⚖️ Maintain healthy weight
🧘 Stress management
🚭 No smoking
☕ Limit caffeine
🩺 Regular monitoring''';

    case 'Asthma':
      return '''🌬️ What is Asthma?
• Chronic lung condition causing inflamed airways
• Triggers: Dust, pollution, pollen, cold air

⚠️ Symptoms:
• Wheezing (whistling sound when breathing)
• Chest tightness
• Shortness of breath
• Nighttime coughing

🏡 Home Care:
• Use prescribed inhalers correctly
• Identify and avoid triggers
• Practice breathing exercises
• Keep living space clean/dust-free

🚑 When to Seek Help:
• Inhaler not working
• Difficulty speaking due to breathlessness
• Blue lips/fingernails''';

    case 'Anemia':
      return '''💉 What is Anemia?
• Low red blood cells or hemoglobin
• Reduces oxygen delivery to body

⚠️ Symptoms:
• 😴 Extreme fatigue
• 🥴 Dizziness
• 🩹 Pale skin/nails
• 💨 Shortness of breath
• ❤️ Rapid heartbeat

🍽️ Dietary Solutions:
• Iron-rich foods: Spinach, lentils, jaggery
• Vitamin C helps absorption (citrus fruits)
• Avoid tea/coffee with meals
• Consider iron supplements if advised

🩺 When to See Doctor:
• Symptoms persist despite diet changes
• Heavy menstrual bleeding
• Pregnancy-related anemia''';

    case 'Arthritis':
      return '''🦵 What is Arthritis?
• Joint inflammation causing pain/stiffness
• Common types: Osteoarthritis, Rheumatoid

⚠️ Symptoms:
• Joint pain (worse in mornings)
• Swelling/redness
• Reduced mobility
• Grating sensation in joints

🏡 Management Tips:
• Gentle exercise (walking, swimming)
• Hot/cold compresses
• Maintain healthy weight
• Anti-inflammatory diet (turmeric, omega-3s)
• Assistive devices if needed

🩺 When to Seek Help:
• Severe pain affecting daily activities
• Joint deformity developing
• Morning stiffness >30 minutes''';

    case 'Migraine':
      return '''🤕 What is Migraine?
• Severe headache often with nausea
• Typically one-sided, throbbing pain

⚠️ Symptoms:
• 🌀 Aura (visual disturbances)
• 🤢 Nausea/vomiting
• 🔦 Light/sound sensitivity
• 😴 Postdrome (exhaustion after attack)

🔍 Common Triggers:
• Stress/lack of sleep
• Hormonal changes
• Certain foods (cheese, chocolate)
• Strong smells
• Weather changes

💡 Relief Methods:
• Rest in dark, quiet room
• Cold compress on forehead
• Stay hydrated
• Identify/avoid triggers
• Prescription meds if needed''';

    case 'Thyroid Disorders':
      return '''🦋 Thyroid Basics:
• Small gland regulating metabolism
• Two main disorders:
  1️⃣ Hypothyroidism (underactive)
  2️⃣ Hyperthyroidism (overactive)

⚠️ Hypo Symptoms:
• 😴 Fatigue
• ⚖️ Weight gain
• 🥶 Feeling cold
• 💇 Hair loss
• 😔 Depression

⚠️ Hyper Symptoms:
• ⚖️ Weight loss
• 😰 Anxiety
• 💓 Rapid heartbeat
• 🥵 Heat intolerance
• 🤲 Tremors

🩺 Management:
• Regular TSH tests
• Take prescribed medication
• Balanced diet (iodine, selenium)
• Stress management
• Adequate sleep''';

    case 'PCOS/PCOD':
      return '''🌸 What is PCOS?
• Hormonal imbalance in reproductive age
• Causes irregular periods, cysts on ovaries

⚠️ Symptoms:
• 🔄 Irregular/missed periods
• ⚖️ Weight gain (especially belly)
• 🧔‍♀️ Excess facial hair
• 💇 Thinning scalp hair
• 🧴 Acne/oily skin
• 🤰 Fertility challenges

🩺 Why It Matters:
• Increases diabetes risk
• Can affect heart health
• Impacts self-esteem

✅ Management:
• Balanced diet (low sugar/processed foods)
• Regular exercise
• Stress reduction
• Medications if needed
• Regular health checks''';

    case 'Anxiety':
      return '''😰 What is Anxiety?
• Persistent excessive worry
• Interferes with daily life

⚠️ Symptoms:
• 🧠 Racing thoughts
• 💓 Rapid heartbeat
• 🤲 Sweating/trembling
• 😨 Panic attacks
• 😴 Sleep disturbances

💡 Coping Strategies:
• Deep breathing exercises
• Regular physical activity
• Limit caffeine/alcohol
• Mindfulness/meditation
• Establish routine
• Talk therapy options

🆘 When to Seek Help:
• Affects work/relationships
• Causes physical symptoms
• Leads to avoidance behaviors''';

    case 'Depression':
      return '''😞 What is Depression?
• Persistent sadness/loss of interest
• More than just "feeling blue"

⚠️ Symptoms:
• 😢 Persistent sadness
• 🛌 Loss of energy
• 🍽️ Appetite changes
• 😴 Sleep disturbances
• 🤯 Difficulty concentrating
• 💭 Feelings of worthlessness

🛑 Risk Factors:
• Family history
• Trauma/stress
• Chronic illness
• Hormonal changes

💡 Recovery Tips:
• Maintain daily routine
• Stay connected with others
• Regular physical activity
• Sunlight exposure
• Professional therapy
• Medication if prescribed''';

    case 'Insomnia':
      return '''🌙 What is Insomnia?
• Persistent difficulty sleeping
• Affects daytime functioning

⚠️ Symptoms:
• 😴 Trouble falling asleep
• 🕒 Frequent nighttime waking
• 🌅 Early morning awakening
• ☀️ Daytime fatigue

🔍 Common Causes:
• Stress/anxiety
• Poor sleep habits
• Screen time before bed
• Caffeine/alcohol
• Underlying health issues

💤 Sleep Hygiene Tips:
• Consistent sleep schedule
• Dark, cool, quiet bedroom
• Screen-free 1 hour before bed
• Relaxing bedtime routine
• Limit daytime naps
• Avoid late caffeine

🩺 When to Seek Help:
• Lasting >3 weeks
• Affects daily life
• Accompanied by other symptoms''';

    case 'Eating Disorders':
      return '''🍽️ Eating Disorder Basics:
• Unhealthy relationship with food/body
• Serious mental health conditions

⚠️ Common Types:
1️⃣ Anorexia (severe restriction)
2️⃣ Bulimia (binge-purge cycles)
3️⃣ BED (binge eating disorder)

🆘 Warning Signs:
• Extreme weight changes
• Food rituals/avoidance
• Excessive exercise
• Bathroom visits after meals
• Social withdrawal

❤️ Recovery Tips:
• Professional treatment
• Nutritional counseling
• Therapy (CBT often helpful)
• Support groups
• Address underlying issues

🩺 When to Seek Help:
• Physical health declining
• Thoughts of self-harm
• Inability to stop behaviors''';

    case 'Stress and Burnout':
      return '''🔥 What is Burnout?
• Physical/emotional exhaustion
• Caused by prolonged stress

⚠️ Symptoms:
• 😩 Chronic fatigue
• 😤 Irritability
• 🧠 Brain fog
• 😔 Detachment
• 🏥 Frequent illnesses

🔄 Stress vs Burnout:
Stress:
• Over-engaged
• Urgency/hyperactivity
• Can see light at tunnel's end

Burnout:
• Disengaged
• Hopelessness
• Feels inescapable

🛡️ Prevention Tips:
• Set healthy boundaries
• Take regular breaks
• Practice self-care
• Maintain social connections
• Seek professional support
• Reevaluate priorities''';

    default:
      return 'Details for $title will be added soon.';
  }
}


  @override
  Widget build(BuildContext context) {
    final content = getConditionDetails(title,context);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(child: Text(content)),
      ),
    );
  }
}
