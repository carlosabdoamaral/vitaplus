// workout_data.dart

import 'package:vitaplus/models/exercise_model.dart';
import 'package:vitaplus/models/workout_model.dart';

// Lista de treinos de exemplo
final List<WorkoutModel> workoutData = [
  WorkoutModel(
    id: 1,
    name: 'Alongamento com Carlos',
    durationInMinutes: 5,
    category: 'Alongamento',
    bannerImage: 'assets/images/workout_01_banner.png',
    exercises: [
      ExerciseModel(
        id: 1,
        name: 'Escapula unilateral',
        sets: 1,
        reps: 8,
        durationPerRepInSeconds: 10,
        restBetweenSetsInSeconds: 10,
        bannerImage: 'assets/images/workout_01_01.png',
        videoUrl: '',
        description:
            'Alongamento específico para a região escapular, ideal para melhorar a mobilidade e aliviar a tensão nos ombros.',
        status: 0,
      ),
      ExerciseModel(
        id: 2,
        name: 'Ombros',
        sets: 1,
        reps: 1,
        durationPerRepInSeconds: 30,
        restBetweenSetsInSeconds: 15,
        bannerImage: 'assets/images/workout_01_02.png',
        videoUrl: 'https://www.youtube.com/watch?v=example4',
        description:
            'Alongamento que foca na flexibilização dos músculos dos ombros, essencial para prevenir lesões e melhorar a amplitude de movimento.',
        status: 0,
      ),
      ExerciseModel(
        id: 3,
        name: 'Quadríceps',
        sets: 1,
        reps: 1,
        durationPerRepInSeconds: 30,
        restBetweenSetsInSeconds: 15,
        bannerImage: 'assets/images/workout_01_03.png',
        videoUrl: 'https://www.youtube.com/watch?v=example5',
        description:
            'Alongamento dos músculos anteriores da coxa, fundamental para a manutenção da flexibilidade e para a prevenção de cãibras.',
        status: 0,
      ),
      ExerciseModel(
        id: 4,
        name: 'Posterior',
        sets: 1,
        reps: 1,
        durationPerRepInSeconds: 30,
        restBetweenSetsInSeconds: 15,
        bannerImage: 'assets/images/workout_01_04.png',
        videoUrl: 'https://www.youtube.com/watch?v=example5',
        description:
            'Alongamento voltado para a musculatura posterior da coxa, importante para melhorar a flexibilidade e aliviar a rigidez.',
        status: 0,
      ),
      ExerciseModel(
        id: 5,
        name: 'Panturrilha',
        sets: 1,
        reps: 1,
        durationPerRepInSeconds: 30,
        restBetweenSetsInSeconds: 15,
        bannerImage: 'assets/images/workout_01_05.png',
        videoUrl: 'https://www.youtube.com/watch?v=example5',
        description:
            'Alongamento dos músculos da panturrilha, essencial para aumentar a flexibilidade e ajudar na prevenção de lesões em atividades que envolvem corrida ou salto.',
        status: 0,
      ),
      ExerciseModel(
        id: 6,
        name: 'Tibial',
        sets: 1,
        reps: 1,
        durationPerRepInSeconds: 30,
        restBetweenSetsInSeconds: 15,
        bannerImage: 'assets/images/workout_01_06.png',
        videoUrl: 'https://www.youtube.com/watch?v=example5',
        description:
            'Alongamento que se concentra nos músculos tibiais, útil para melhorar a mobilidade do tornozelo e prevenir dores na canela.',
        status: 0,
      ),
    ],
  ),
];
